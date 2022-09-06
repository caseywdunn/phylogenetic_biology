# Exercises

Each folder contains exercises for one chapter. How they are run will depend on the specifics of each course (or independent reader's preferences and circumstances).

## Computers

### Computer requirements

You can use a computer with MacOS, Linux, or Windows to complete the exercises provided here.

A Unix-like environment (eg linux or MacOS) is required for some analyses. Fortunately, linux 
can be readily installed within modern Windows (versions 10 and 11) using 
the Windows Subsystem for Linux (WSL). To install WSL (currently at version 2, ie WSL2) on Windows, run the following command in PowerShell:

    wsl --install

This will install WSL, and an Ubuntu linux distribution. More information on installing WSL is available at 
https://docs.microsoft.com/en-us/windows/wsl/install.

To access Ubuntu from the command line on your windows computer, open the Terminal application (you may need to download this from the Microsoft store). Click the down arrow at the top of the window (to the right of +), and select Ubuntu. This will open a linux shell.

### Running analyses on a remote cluster

While all exercises can be run locally on your own computer, you may chose to run some of the more 
computationally intensive analyses remotely on a cluster if one is available. This will speed them 
up, and provide experience using high performance computing resources that are often used for larger 
phylogenetic analyses.

There is considerable 
variation across clusters, so it isn't possible to provide guidance on all situations. For some 
exercises I have included example job scripts (named some variation of `job.sh`) that work with our 
[Yale Center for Research Computing](https://research.computing.yale.edu/) clusters. These can be 
modified for your own use as needed. If you are using a cluster for data analysis, then some of the software listed in the requirements will be installed on the cluster rather than your local computer.

## Software Requirements

The following are installed on your local computer (e.g. your laptop):

- R, http://www.r-project.org. The R language, which has many powerful libraries for phylogenetic biology.
- RStudio (open source desktop version), https://rstudio.com/products/rstudio/download/. An Interactive Development Environment (IDE) for writing and running R programs.
- FigTree, http://tree.bio.ed.ac.uk/software/figtree/. A stand-alone viewer for phylogenetic trees. Requires [Java](https://www.java.com/en/download/), which you will need to install if you don't have it already. 
- Visual studio Code, https://code.visualstudio.com/. A text editor and IDE that we will use for inspecting and editing a variety of files.

The following can be installed on your local computer or a remote cluster. Windows users are advised to install these programs within WSL rather than directly in Windows.


- seq-gen, http://tree.bio.ed.ac.uk/software/seqgen/. A Windows version is not available, so on Windows it must be run in WSL.
- IQTree, http://www.iqtree.org/
- mafft, https://mafft.cbrc.jp/alignment/software/
- revbayes, https://revbayes.github.io/download 


### Optional software

These items may be helpful, but are not necessary

#### Markdown tools

If you would like to convert markdown documents to pdfs, you will need to install LaTeX. The easiest way to do that is with [TinyTeX](https://yihui.org/tinytex/). From an R console (in RStudio or at the command line), enter the following R commands to install TinyTex:

    install.packages('tinytex')
    tinytex::install_tinytex()

Markdown files are used in many contexts. If you would like to convert any markdown file to a pdf, without using RStudio, I suggest downloading and installing [pandoc](https://pandoc.org/installing.html). Then at the command line, you can convert a markdown file to any format you like. For example:

    pandoc test.md -o test.pdf
    pandoc test.md -o test.html
    pandoc test.md -o test.docx

This creates pdf, html, and docx versions of `test.md`. The input file is specified right after the `pandoc` command, and the output file is specified right after `-o`. It figures out the input and output formats from the file extensions.

#### git

`git` is a widely used version control tool. It is a single framework that facilitates sharing of files, collaboration, backup, and recording the history of edits. You can download the exercises with git as described in the section below.

`git` can be downloaded at https://git-scm.com/downloads.

You can also download a desktop app to use `git` with the online service GitHub at https://desktop.github.com/ .

## Downloading the exercises

The exercises are in the github repository for this book, available at https://github.com/caseywdunn/phylogenetic_biology. There are two different ways to transfer the files to your computer:

- Go to https://github.com/caseywdunn/phylogenetic_biology, and click the large green Code button at the upper right. From the dropdown menu, select Download ZIP. Uncompress this file and move the resulting folder to where you would like to work on it.

- If you have git installed, open a terminal and `cd` to the directory where you would like the files to reside. Then run `git clone https://github.com/caseywdunn/phylogenetic_biology.git`.

The operations above (whichever you chose) will download a directory `phylogenetic_biology` with all the files for this book, including the source code for the text itself. The exercises are in the `phylogenetic_biology/exercises` subdirectory, organized by chapter.
