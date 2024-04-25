library(dplyr)
library(targets)
library(tarchetypes)

source("src/functions.R")

list(
  # simulation -----------
  tar_target(coefs, setup_coefficients()),
  tar_target(simulate, simulate_data(coefs, n_studies = 1000)),
  
  # report ------
  tarchetypes::tar_quarto(causality_intro, "article/intro-causality.qmd")
)
