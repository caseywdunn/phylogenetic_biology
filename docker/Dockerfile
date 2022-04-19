FROM rocker/verse:4.1.3

RUN Rscript -e "library(BiocManager); BiocManager::install('ggtree'); \
                                      BiocManager::install('treeio');"

RUN install2.r --error \
    --deps TRUE \
    ape \
    geiger \
    ggimage \
    ggrepel \
    gridExtra \
    kableExtra \
    phytools

RUN tlmgr update --self \
 && tlmgr init-usertree \
 && tlmgr update --all \
 && tlmgr install \
    ae \
    amsfonts \
    amsmath \
    atbegshi \
    atveryend \
    auxhook \
    babel \
    bibtex \
    bigintcalc \
    bitset \
    booktabs \
    cm \
    colortbl \
    context \
    dehyph \
    dvipdfmx \
    environ \
    etex \
    etexcmds \
    etoolbox \
    euenc \
    fancyvrb \
    firstaid \
    float \
    fontspec \
    framed  \
    gettitlestring \
    glyphlist \
    graphics \
    graphics-cfg \
    graphics-def \
    grffile \
    hycolor \
    hyperref \
    hyph-utf8 \
    iftex \
    inconsolata \
    infwarerr \
    intcalc \
    knuth-lib \
    kvdefinekeys \
    kvoptions \
    kvsetkeys \
    l3backend \
    l3kernel \
    l3packages \
    latex \
    latex-amsmath-dev \
    latex-bin \
    latex-fonts \
    latexconfig \
    letltxmacro \
    listings \
    lm \
    lm-math \
    ltxcmds \
    lua-alt-getopt \
    luahbtex \
    lualibs \
    luaotfload \
    luatex \
    makecell \
    makeindex \
    manfnt-font \
    mdwtools \
    metafont \
    metapost \
    mflogo-font \
    mfware \
    modes \
    mptopdf \
    ms \
    multirow \
    natbib \
    parskip \
    pdfcrop \
    pdfescape \
    pdflscape \
    pdftex \
    pdftexcmds \
    plain \
    refcount \
    rerunfilecheck \
    stmaryrd \
    stringenc \
    tabu \
    tex \
    tex-ini-files \
    texlive-scripts \
    threeparttable \
    threeparttablex \
    tipa \
    tools \
    trimspaces \
    ulem \
    unicode-data \
    unicode-math \
    uniquecounter \
    url \
    varwidth \
    wrapfig \
    xcolor \
    xetex \
    xetexconfig \
    xkeyval \
    xunicode \
    collection-fontsrecommended \
    geometry \
    zapfding 
