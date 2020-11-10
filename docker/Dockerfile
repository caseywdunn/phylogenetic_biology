FROM rocker/verse:4.0.3

RUN Rscript -e "library(BiocManager); BiocManager::install('ggtree'); \
                                      BiocManager::install('treeio');"

RUN install2.r --error \
    --deps TRUE \
    ape \
    geiger \
    ggimage \
    gridExtra \
    kableExtra \
    phytools




