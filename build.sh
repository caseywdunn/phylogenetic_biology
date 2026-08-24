#!/usr/bin/env bash
#
# Build the book in the project's Docker container, driven from the host.
#
#   ./build.sh html              render the gitbook into docs/
#   ./build.sh pdf               render the PDF into docs/ (gitignored)
#   ./build.sh all               both
#   ./build.sh release X.Y.Z     step 2 of the release ritual (development.md)
#
# The container is disposable; the repository is bind-mounted into it. Nothing
# here needs to run from inside a container, and no R packages need to be
# installed on the host.

set -euo pipefail

IMAGE="${IMAGE:-phylogenetic_biology:latest}"
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOUNT="/phylogenetic_biology"

die() { printf 'build.sh: %s\n' "$1" >&2; exit 1; }

# Run one R expression against the mounted repository.
#
# -u keeps build products owned by the invoking user rather than root, and
# HOME must then point somewhere writable, since the container has no home
# directory for that uid.
#
# RENV_CONFIG_AUTOLOADER_ENABLED=FALSE is required, not incidental. The image
# already has the lockfile restored into its site-library (the Dockerfile runs
# renv::restore() under --vanilla, so packages land in the default library).
# The bind mount then drops the repository's own renv/ on top of that, and its
# .Rprofile tries to activate a project library that exists on the host only as
# an empty shell. Without this the autoloader aborts and every package looks
# missing. Bypassing renv inside the container is therefore the correct
# behavior: the image *is* the restored lockfile.
r() {
  docker run --rm \
    -u "$(id -u):$(id -g)" \
    -e HOME=/tmp \
    -e RENV_CONFIG_AUTOLOADER_ENABLED=FALSE \
    -v "$REPO:$MOUNT" \
    -w "$MOUNT" \
    "$IMAGE" \
    Rscript -e "$1"
}

require_image() {
  docker image inspect "$IMAGE" >/dev/null 2>&1 || die \
"image '$IMAGE' not found. Build it from the repository root with:

    docker build -f docker/Dockerfile -t phylogenetic_biology:latest ."
}

build_html() {
  echo "==> gitbook"
  r 'bookdown::render_book("index.rmd", "bookdown::gitbook")'
}

# The PDF build needs the real latexmk, which the image provides. The index is
# a fixed point over pagination, so latexmk may run the engine several times;
# see "The back-of-book index requires latexmk" in development.md.
build_pdf() {
  echo "==> pdf"
  r 'bookdown::render_book("index.rmd", "bookdown::pdf_book")'
}

current_version() {
  sed -nE 's/^version:[[:space:]]*"?([^"[:space:]]+)"?[[:space:]]*$/\1/p' "$REPO/index.rmd"
}

# Step 2 of the release ritual. Everything here happens on dev; the merge to
# master, the tag, and the push stay manual.
#
# The build/commit/rebuild/commit ordering is the point of this function. The
# Software versions chapter stamps `git log -1` into the book, so the docs that
# ship must be rendered *after* the "Version X.Y.Z" commit exists. Rendering
# once and committing everything together silently stamps the previous commit.
do_release() {
  local version="$1"

  [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] \
    || die "version must look like X.Y.Z, got '$version'"

  cd "$REPO"

  local branch
  branch="$(git rev-parse --abbrev-ref HEAD)"
  [[ "$branch" == "dev" ]] || die "releases are cut from dev, but HEAD is on '$branch'"

  git diff --quiet && git diff --cached --quiet \
    || die "working tree is dirty. Land or stash everything first (step 1)."

  # The failure this exists to catch: master carries commits that never came
  # back to dev (the previous cycle skipped its final merge), so releasing dev
  # would silently revert them.
  if git rev-parse --verify -q master >/dev/null; then
    git merge-base --is-ancestor master dev || die \
"master is not an ancestor of dev -- these commits would be reverted by this release:

$(git log --oneline dev..master | sed 's/^/    /')

Run the final step of the previous cycle first:

    git merge master"
  fi

  # `git add -A` below sweeps untracked files into the release commit. That is
  # usually what you want, but not always, so make it a decision rather than a
  # surprise.
  local untracked
  untracked="$(git ls-files --others --exclude-standard)"
  if [[ -n "$untracked" ]]; then
    echo "build.sh: these untracked files will be committed into the release:" >&2
    echo "$untracked" | sed 's/^/    /' >&2
    read -r -p "Continue? [y/N] " reply
    [[ "$reply" == [yY] ]] || die "aborted"
  fi

  require_image

  # Step 2. index.rmd is the single source of truth; everything else derives.
  if [[ "$(current_version)" == "$version" ]]; then
    echo "==> version already $version, not bumping"
  else
    echo "==> bumping $(current_version) -> $version"
    sed -i -E "s/^version:[[:space:]]*\"?[^\"[:space:]]+\"?[[:space:]]*$/version: $version/" index.rmd
    [[ "$(current_version)" == "$version" ]] || die "version bump did not take"
  fi

  # Step 3. Provisional: its only job is to propagate the new version into the
  # generated files (frontpage.tex, CITATION.cff) that go into the next commit.
  build_html

  # Step 4.
  echo "==> commit: Version $version"
  git add -A
  git commit -m "Version $version"

  # Step 5. Now that HEAD is the release commit, the Software versions chapter
  # stamps the right hash into both formats.
  build_html
  build_pdf

  # Step 6.
  echo "==> commit: Build docs for $version"
  git add -A
  if git diff --cached --quiet; then
    echo "build.sh: rebuild produced no changes, nothing to commit" >&2
  else
    git commit -m "Build docs for $version"
  fi

  cat <<EOF

Done. Remaining steps of the release ritual, by hand:

    pdftotext -layout docs/phylogenetic_biology.pdf - | tail -45 \\
      | grep -E "bootstrap|ultrametric|Brownian"   # spot-check the index

    git checkout master && git merge --no-ff dev
    git tag -a "v$version" -m "Version $version"
    git push origin master dev --tags
    git checkout dev && git merge master

For a major or minor version, then create the GitHub release on v$version so
Zenodo mints the version DOI.
EOF
}

case "${1:-}" in
  html)    require_image; build_html ;;
  pdf)     require_image; build_pdf ;;
  all)     require_image; build_html; build_pdf ;;
  release) [[ $# -eq 2 ]] || die "usage: ./build.sh release X.Y.Z"; do_release "$2" ;;
  *)       sed -n '2,10p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
