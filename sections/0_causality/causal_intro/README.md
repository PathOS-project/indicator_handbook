# Introduction to causality in science studies

This repository contains material for the creation of the preprint

Klebel, T. and Traag, V.A. (2024) "Introduction to causality in science studies"

## Generating the manuscript

The manuscript is written in [Quarto](https://quarto.org/).
In order to generate the manuscript, we need to 

1. [Install the Quarto CLI](https://quarto.org/docs/get-started/) (version>=1.4.549).
2. Run simulations and analyses.
3. Render the manuscript.

The necessary dependencies are stored in an R environment, using `renv`, which should be restored first (after launching R) with

```r
renv::restore()
```

Having installed the Quarto CLI and all necessary R-packages, we can then run the simulation and render the manuscript with

```r
targets::tar_make()
```

In case rendering the PDF does not succeed, it is advisable to render the file directly with

```r
quarto::quarto_render("article/intro-causality.qmd")
```

in R, or in the terminal with

```bash
quarto render article/intro-causality.qmd --to revtex-pdf
```

which will result in more helpful error messages.


## Overview of main files

- `_targets.R`: Defines the pipeline for executing the simulation and analysis.
- `src/functions.R`: Defines the parameters and functions which are used to simulate the data.
- `article/intro-causality.qmd`: Manuscript file.
