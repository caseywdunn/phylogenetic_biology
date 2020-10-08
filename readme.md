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