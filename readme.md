# Phylogenetic Biology

This repository contains all the text, source code, and supporting material for the book *Phylogenetic Biology*, by [Casey Dunn](http://dunnlab.org/).

The formatted book can be viewed at http://dunnlab.org/phylogenetic_biology/index.html .

Please submit any errors you find or suggestions you have via the issue tracker at https://github.com/caseywdunn/phylogenetic_biology/issues .


## License

![](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)

This work is licensed under the [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License]( http://creativecommons.org/licenses/by-nc-nd/4.0/).


## Development

The order of files in the book is specified in `_bookdown.yml`.

### Building the book

In `phylogenetic_biology`, execute:

    bookdown::render_book("index.Rmd", "bookdown::gitbook")

### Running tests

To run tests of the code, launch an R console from the `manuscript/` directory of this
repository and run:

    library( testthat )
    test_dir( "tests/testthat/" )

### Docker

Make sure you have [docker installed](https://docs.docker.com/install/#supported-platforms).

In `docker/`, build the container image with:

``` bash
docker build -t phylogenetic_biology .
```

If building on a macOS host running on apple silicon, instead use:

``` bash
docker build --platform=linux/amd64 -t phylogenetic_biology .
```

The model for executing the manuscript in docker follows that at
https://github.com/caseywdunn/comparative_expression_2017/tree/master/docker .

To run an RStudio session:

``` bash
docker run --rm  -dP -e PASSWORD=secret123 -e USERID=$UID -v /path/to/phylogenetic_biology:/phylogenetic_biology -p 8787:8787 phylogenetic_biology
```

Then go to [http://localhost:8787/](http://localhost:8787/) in your browser. Log in with user/password rstudio/secret123 (Password can be anything except "rstudio"). From the console, you can jump to the repo's R directory with the R command:

    setwd("/phylogenetic_biology")

And then build the book with:

    library(bookdown)
    bookdown::render_book("index.rmd", "bookdown::gitbook")

### Versioning and identifiers

Editions follow software versioning standards of `Major.Minor.Patch`, e.g. `Edition 1.0.13`. These are reflected as tags in the git repository, eg `v1.0.13`. The edition is set at the top of `index.html`.

[GitHub releases](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) are done when the major or minor version are incremented, but not for patches.

Zenodo is used for [DOI generation](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content). The concept doi is included in the text of the book. Version DOIs (triggered by github releases) are not.

A lightweight gitflow model is used. Changes and fixes are usually made on issue branches, eg `issue-54`, that are branched of `dev` and then merged into `dev` when complete. Minor patches can be made on `dev`. Only changes for release are merged into `master`.

Changes look like this:

- Modifications are made to `dev`, directly or merged in from issue branches.
- The edition is incremented and committed.
- `dev` is merged into `master`
- If `Major` or `Minor` versions are incremented, a [release is generated](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases) on the `master` branch, along with release notes. The release notes serve as the version history for the book.

The live web book at https://dunnlab.org/phylogenetic_biology/ reflects the contents of the `docs` folder on the `master` branch.
