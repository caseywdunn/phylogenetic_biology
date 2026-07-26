FROM rocker/verse:4.5.1

RUN apt-get update && apt-get install -y \
    latexmk \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-science \
    texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /project

# Install renv
RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

# Copy renv configuration files
COPY renv.lock renv.lock
RUN mkdir -p renv
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

# Restore packages from lockfile (using --vanilla to prevent bootstrap issues)
RUN R --vanilla -s -e "renv::restore()"

# Original installation code kept for provenance
# RUN Rscript -e "if (!require('BiocManager', quietly = TRUE)) install.packages('BiocManager'); \
#     library(BiocManager); \
#     BiocManager::install('ggtree', update=FALSE, ask=FALSE); \
#     BiocManager::install('treeio', update=FALSE, ask=FALSE);"
#
# RUN install2.r --error \
#     --deps TRUE \
#     ape \
#     geiger \
#     ggimage \
#     ggrepel \
#     gridExtra \
#     kableExtra \
#     phytools