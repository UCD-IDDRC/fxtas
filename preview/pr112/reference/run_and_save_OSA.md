# Run the Ordinal SuStaIn algorithm (OSA) or load results from presaved .rds file if available

Run the Ordinal SuStaIn algorithm (OSA) or load results from presaved
.rds file if available

## Usage

``` r
run_and_save_OSA(
  dataset_name,
  output_folder,
  verbose = TRUE,
  N_S_max,
  rerun = FALSE,
  rda_filename = "data.RData",
  ...
)
```

## Arguments

- dataset_name:

  for naming pickle files

- output_folder:

  where to save pickle files, etc.

- verbose:

  [`logical()`](https://rdrr.io/r/base/logical.html) indicating whether
  to print debugging information

- N_S_max:

  maximum number of subtypes, should be 1 or more

- rerun:

  whether to force a rerun of the python code

- rda_filename:

  name of rda file containing environment used to run analyses

- ...:

  Arguments passed on to
  [`run_OSA`](https://UCD-IDDRC.github.io/fxtas/preview/pr112/reference/run_OSA.md)

  `prob_score`

  :   [array](https://rdrr.io/r/base/array.html) probability of each
      score for all subjects across all biomarkers

      - dim = number of subjects x number of biomarkers x number of
        scores

  `score_vals`

  :   a matrix specifying the scores for each biomarker

      - dim: number of biomarkers x number of scores

  `SuStaInLabels`

  :   the names of the biomarkers as a list of strings

  `N_startpoints`

  :   number of startpoints to use in maximum likelihood step of
      SuStaIn, typically 25

  `N_iterations_MCMC`

  :   number of MCMC iterations, typically 1e5 or 1e6 but can be lower
      for debugging

  `use_parallel_startpoints`

  :   boolean for whether or not to parallelize the maximum likelihood
      loop

  `seed`

  :   random number seed for python code

  `plot`

  :   [`logical()`](https://rdrr.io/r/base/logical.html) indicating
      whether to construct PVD plots via python subroutines

  `N_CV_folds`

  :   number of cross-validation folds to create

  `patient_data`

  :   patient biomarker data

  `CV_fold_nums`

  :   which CV folds to run (for parallel processing)

  `keep_data`

  :   [`logical()`](https://rdrr.io/r/base/logical.html) indicating
      whether to include the ata in the return object

  `fig_size`

  :   python figure size, in inches (width, height)

  `prob_correct`

  :   the probability of correctly classifying the underlying biomarker
      level: p(obs = true)

  `biomarker_levels`

  :   a list containing the levels for each biomarker

## Value

a [`list()`](https://rdrr.io/r/base/list.html)
