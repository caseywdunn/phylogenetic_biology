# Development

Details on compiling and releasing the book.

## Building the book

The order of files in the book is specified in `_bookdown.yml`.

In `phylogenetic_biology`, execute:

    bookdown::render_book("index.rmd", "bookdown::gitbook")

### The back-of-book index requires latexmk

The PDF build needs the real `latexmk` (installed by `docker/Dockerfile`), not
tinytex's R reimplementation of it. The `setup` chunk in `index.rmd` sets
`options(tinytex.latexmk.emulation = FALSE)` when `latexmk` is on the path, and
warns when it is not.

This matters because the index is a fixed point: its page numbers depend on the
pagination of a document the index is part of. Producing it correctly means
treating `.idx` as a build dependency -- run the engine, and if `.idx` changed,
re-run `makeindex` and the engine again, until nothing moves. tinytex's
emulation does not converge on that; it runs `makeindex` once, early, against a
pagination that is still shifting as cross-references resolve. The failure is
silent, since LaTeX treats `.ind` as an ordinary input file and never requests a
rerun, so the build reports success with stale page numbers. Symptom: every
index entry is off by a constant amount, identically on every rebuild.

After a PDF build, spot-check a few entries against the pages they point to:

``` bash
pdftotext -layout docs/phylogenetic_biology.pdf - | tail -45 \
  | grep -E "bootstrap|ultrametric|Brownian"
```

## Running tests

To run tests of the code, launch an R console from the `manuscript/` directory of this
repository and run:

    library( testthat )
    test_dir( "tests/testthat/" )

## Docker

Make sure you have [docker installed](https://docs.docker.com/install/#supported-platforms).

### Linux host setup (use docker-ce, not Docker Desktop)

On a Linux host, install the native `docker-ce` daemon rather than Docker Desktop. Docker Desktop for Linux runs the engine inside a VM and bridges host paths through a fuse layer with directory-entry caching. That cache breaks git's atomic-rename ref updates: after a `git commit` on the host, files like `.git/refs/heads/<branch>` and `.git/index` are stale inside the container, and `git status` disagrees between host and container. The mixed host+container workflow (editing and git on host, R execution in container) requires real, uncached bind mounts.

Install on Ubuntu (per [Docker's official instructions](https://docs.docker.com/engine/install/ubuntu/)):

``` bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER          # run docker without sudo
sudo systemctl enable --now docker     # start now and on every boot
```

Log out and back in (or reboot) so the `docker` group takes effect. Verify:

``` bash
docker info --format '{{.OperatingSystem}}'   # should NOT say "Docker Desktop"
docker run --rm hello-world
```

If migrating from Docker Desktop, save any images you want to keep to a tar first (`docker save phylogenetic_biology:latest | gzip > image.tar.gz`) — Docker Desktop's images live in its VM and are invisible to `docker-ce`. Restore with `docker load < image.tar.gz` after installing `docker-ce`.

To confirm real bind mounts are in effect, compare inodes host vs. container:

``` bash
# host
stat -c '%i' ~/repos/phylogenetic_biology/.git/refs/heads/dev
# inside the container
stat -c '%i' /phylogenetic_biology/.git/refs/heads/dev
```

Matching inodes = real kernel bind mount, no drift.

### Building the Docker image

**Important**: Build from the repository root (not the `docker/` directory) to include renv files in the build context.

From the repository root, build the container image with:

``` bash
docker build -f docker/Dockerfile -t phylogenetic_biology:latest .
```

If building on a macOS host running on apple silicon, instead use:

``` bash
docker build --platform=linux/amd64 -f docker/Dockerfile -t phylogenetic_biology:latest .
```

To tag the image with a version:

``` bash
docker tag phylogenetic_biology:latest phylogenetic_biology:YYYYMMDD_NN
```

### Running the Docker container

The model for executing the manuscript in docker follows that at
https://github.com/caseywdunn/comparative_expression_2017/tree/master/docker .

To run an RStudio session:

``` bash
docker run --rm -dP -e PASSWORD=secret123 -e USERID=$UID -v /path/to/phylogenetic_biology:/phylogenetic_biology -p 8787:8787 phylogenetic_biology:latest
```

Then go to [http://localhost:8787/](http://localhost:8787/) in your browser. Log in with user/password rstudio/secret123 (Password can be anything except "rstudio"). From the console, you can jump to the repo's R directory with the R command:

    setwd("/phylogenetic_biology")

And then build the book with:

    library(bookdown)
    bookdown::render_book("index.rmd", "bookdown::gitbook")

### Managing R packages with renv

This project uses [renv](https://rstudio.github.io/renv/) for R package management. The `renv.lock` file captures all package dependencies and versions.

When you build the Docker image, packages are automatically installed via `renv::restore()` based on the lockfile.

#### Adding new packages

If you need to add a package that isn't automatically detected by renv (e.g., packages that are only "Suggests" dependencies):

1. From the repository root, use the existing Docker image to record the package:

``` bash
docker run --rm -v $(pwd):/project -w /project phylogenetic_biology:latest R --vanilla -s -e "renv::record('package_name')"
```

2. Rebuild the Docker image to include the new package:

``` bash
docker build -f docker/Dockerfile -t phylogenetic_biology:latest .
```

Alternatively, if working directly in R (not in Docker):

``` r
renv::record('package_name')    # Add package to lockfile
renv::install('package_name')   # Install package
renv::snapshot()                # Update lockfile with all dependencies
```

## Versioning and releases

### Single source of truth for the version

The version number lives in exactly one place: the `version:` field in the YAML
metadata at the top of `index.rmd`. Never write the version number anywhere else
in the book's content. At build time it is read from that field and propagated
automatically to:

- the PDF title and copyright pages, via the generated `frontpage.tex` (the
  `create-frontpage` chunk in `index.rmd`),
- `CITATION.cff` (the `create-citation-cff` chunk in `index.rmd`), and
- the "Distribution" and recommended-citation text in the Preface (inline
  `` `r edition_value` `` references).

The publication year is centralized the same way, in the `major_edition_year:`
field. The only consumers that live *outside* the content are the git tag and
the GitHub release; the ritual below reads the version straight from `index.rmd`
when tagging so the tag can never drift from the printed version.

Versions follow [Semantic Versioning](https://semver.org/), `Major.Minor.Patch`
(e.g. `1.0.13`):

- **Major** -- substantial reorganization or new material. Gets a new ISBN, a
  GitHub release, and a Zenodo version DOI.

  **The major version *is* the edition**: `1.x.y` is the First Edition, `2.x.y`
  the Second Edition, and so on. A new edition therefore coincides with a new
  ISBN. The edition ordinal printed on the title page ("First Edition") is
  derived from the major version by the `create-frontpage` chunk in `index.rmd`,
  so it is never set by hand -- editing `version:` is all that is required.
  Versions below `1.0.0` are pre-release and carry no edition statement.
- **Minor** -- content is added or substantially revised, but existing citations
  remain valid. Gets a GitHub release and a Zenodo version DOI.
- **Patch** -- typographical fixes, wording clarifications, and other editorial
  changes that do not alter substantive content. Tagged, but no GitHub release.

[Zenodo](https://zenodo.org/) mints DOIs via
[GitHub release archiving](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content).
Only the concept DOI (which always resolves to the latest version) is printed in
the book; per-version DOIs are created automatically when a GitHub release is
made.

The digital (HTML and PDF) edition is not assigned an ISBN. The paperback and
hardcover each have their own ISBN, and both are printed on the copyright page so
the same interior files serve both formats. New ISBNs are assigned only at major
versions.

### Branching model

`master` always reflects the current production version -- exactly what is live
at <https://dunnlab.org/phylogenetic_biology/> (served from the `docs/` folder on
`master`) and archived on Zenodo. Never commit work in progress to `master`.

`dev` is the integration branch for the next version. All changes are made on
`dev`: small fixes directly, larger work on `issue-NN` branches that are cut from
`dev` and merged back into `dev` when complete.

### Release ritual

Do all of steps 1-4 on `dev`, then release from `master`:

1. Land every change intended for the release on `dev`.
2. Bump the version: edit `version:` in `index.rmd` (and `major_edition_year:`
   if the year has changed). This is the only place the number is edited.
3. Rebuild the HTML so the generated files pick up the new version:

        bookdown::render_book("index.rmd", "bookdown::gitbook")

   This regenerates `frontpage.tex`, `CITATION.cff`, and the HTML in `docs/`.
4. Commit the result on `dev`:

        git add -A
        git commit -m "Version X.Y.Z"

5. Merge into `master` (production):

        git checkout master
        git merge --no-ff dev

6. Tag the release, reading the number straight from `index.rmd` so the tag
   cannot drift from the printed version:

        VERSION=$(grep -E '^edition:' index.rmd | sed -E 's/edition:[[:space:]]*"?//; s/"?[[:space:]]*$//')
        git tag -a "v$VERSION" -m "Version $VERSION"

7. Push everything:

        git push origin master dev --tags

8. For **major or minor** versions only, create a
   [GitHub release](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases)
   on the new tag, with release notes. The release notes are the book's version
   history, and publishing the release triggers Zenodo to mint the version DOI.
9. Return to `dev` for the next cycle, keeping it current with production:

        git checkout dev
        git merge master

## Other

`CITATION.cff` can be validated with [this](https://citation-file-format.github.io/tutorials/).