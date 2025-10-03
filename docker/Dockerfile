FROM rocker/verse:4.5.1

RUN apt-get update && apt-get install -y \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "if (!require('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
    library(BiocManager); \
    BiocManager::install('ggtree', update=FALSE, ask=FALSE); \
    BiocManager::install('treeio', update=FALSE, ask=FALSE);"

RUN install2.r --error \
    --deps TRUE \
    ape \
    geiger \
    ggimage \
    ggrepel \
    gridExtra \
    kableExtra \
    phytools