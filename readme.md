# Phylogenetic Biology

This book is a collection of lecture notes by Casey Dunn for his coures 
Phylogenetic Biology (EEB354, Yale).

The formatted book can be viewed at http://dunnlab.org/phylogenetic_biology/index.html .

The order of files in the book is specified in `_bookdown.yml`.


## Development

### Running tests

To run tests of the code, launch an R console from the `manuscript/` directory of this
repository and run:

    library( testthat )
    test_dir( "tests/testthat/" )

### Docker

## Docker

Make sure you have [docker installed](https://docs.docker.com/install/#supported-platforms).

In `docker/`, build the container image with:

``` bash
docker build -t phylogenetic_biology .
```

### Running analyses

The model for executing the manuscript follows that at
https://github.com/caseywdunn/comparative_expression_2017/tree/master/docker .

To run an RStudio session:

``` bash
docker run --rm  -dP -e PASSWORD=secret123 -e USERID=$UID -v /path/to/phylogenetic_biology:/phylogenetic_biology -p 8787:8787 phylogenetic_biology
```

Then go to [http://localhost:8787/](http://localhost:8787/) in your browser. Log in with user/password rstudio/secret123 (Password can be anything except "rstudio"). You can jump to the repo's R directory with the R command: