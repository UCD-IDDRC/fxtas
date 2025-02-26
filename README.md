
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fxtas

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/UCD-IDDRC/fxtas/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/UCD-IDDRC/fxtas/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `fxtas` is to apply the Ordinal SuStaIn algorithm (Young et
al. (2021)) to study disease progression in fragile X-associated
tremor/ataxia syndrome,  
as described in Morrison et al (not yet published), “Progression of
fragile X-associated tremor/ataxia syndrome revealed by subtype and
stage inference”.

## Installation

You can install the development version of fxtas from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UCD-IDDRC/fxtas")
```

## Running the analyses

The manuscript is implemented in the file `ordinal-sustain.qmd` in the
`vignettes/articles` subfolder, which incorporates several subfiles in
this repository. The `data-raw` folder contains numerous auxiliary
scripts, including:

- data preprocessing scripts, which be run in the following order (after
  extracting the necessary files from the GP, GP4, and Trax research
  databases):
  - `gp3.r`
  - `gp4.r`
  - `gp34.R`
  - `trax.R`
- [SLURM](https://slurm.schedmd.com/documentation.html) batch scripts
  and corresponding R scripts for pre-running the computation-heavy
  sections of the analysis on an appropriately-preconfigured distributed
  computing server.
  - If the corresponding output files have not been pre-generated,
    `ordinal-sustain.qmd` should produce them

# References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-young2021ordinal" class="csl-entry">

Young, Alexandra L, Jacob W Vogel, Leon M Aksman, Peter A Wijeratne,
Arman Eshaghi, Neil P Oxtoby, Steven CR Williams, Daniel C Alexander,
and Alzheimer’s Disease Neuroimaging Initiative. 2021. “Ordinal SuStaIn:
Subtype and Stage Inference for Clinical Scores, Visual Ratings, and
Other Ordinal Data.” *Frontiers in Artificial Intelligence* 4: 613261.
<https://doi.org/10.3389/frai.2021.613261>.

</div>

</div>
