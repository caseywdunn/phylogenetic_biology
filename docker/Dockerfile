FROM rocker/verse:4.0.3

ARG arg_bioc_version=3.8

RUN install2.r --error \
    --deps TRUE \
    ape \
    geiger \
    gridExtra \
    kableExtra \
    phytools


RUN Rscript -e "library(BiocManager); BiocManager::install('ggtree', version = $bioc_version); \
                                      BiocManager::install('treeio', version = $bioc_version);"

