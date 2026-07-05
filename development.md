# Development

Details on compiling and releasing the book.

## Building the book

The order of files in the book is specified in `_bookdown.yml`.

In `phylogenetic_biology`, execute:

    bookdown::render_book("index.rmd", "bookdown::gitbook")

## Running tests

To run tests of the code, launch an R console from the `manuscript/` directory of this
repository and run:

    library( testthat )
    test_dir( "tests/testthat/" )

## Docker

Make sure you have [docker installed](https://docs.docker.com/install/#supported-platforms).

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

Or build the PDF version:

    bookdown::render_book("index.rmd", "bookdown::pdf_book")

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

## Versioning and identifiers

Editions follow software versioning standards of `Major.Minor.Patch`, e.g. `Edition 1.0.13`. These are reflected as tags in the git repository, eg `v1.0.13`. The edition is set at the top of `index.html`.

[GitHub releases](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) are done when the major or minor version are incremented, but not for patches.

[Zenodo](https://zenodo.org/) is used for [DOI generation](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content). The concept doi is included in the text of the book. Version DOIs (triggered by github releases) are not.

A lightweight gitflow model is used. Changes and fixes are usually made on issue branches, eg `issue-54`, that are branched of `dev` and then merged into `dev` when complete. Minor patches can be made on `dev`. Only changes for release are merged into `master`.

Changes look like this:

- Modifications are made to `dev`, directly or merged in from issue branches.
- The edition is incremented and committed.
- `dev` is merged into `master`
- If `Major` or `Minor` versions are incremented, a [release is generated](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) on the `master` branch, along with release notes. The release notes serve as the version history for the book.

So, for example:

    git checkout master
    git merge dev
    git push
    git tag -a v0.9.0 -m "Edition 0.9.0"
    git push origin --tags

Then create the release on GitHub.

The live web book at https://dunnlab.org/phylogenetic_biology/ reflects the contents of the `docs` folder on the `master` branch.

The digital version of the book is not assigned an ISBN. The paperback gets an ISBN-B, and the hardback an ISBN-A. Both ISBNs are included on the title page so that the same files can be used for both. ISBN numbers are only incremented on major releases.

## Other

`CITATION.cff` can be validated with [this](https://citation-file-format.github.io/tutorials/).