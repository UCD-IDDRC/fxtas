# Run the Ordinal SuStaIn Algorithm (OSA)

Run the Ordinal SuStaIn Algorithm (OSA)

## Usage

``` r
run_OSA(
  patient_data,
  prob_correct,
  prob_score = compute_prob_scores(dataset = patient_data, prob_correct = prob_correct,
    biomarker_levels = biomarker_levels),
  score_vals = build_score_vals(biomarker_levels),
  biomarker_levels = get_levels(patient_data, varnames = SuStaInLabels),
  SuStaInLabels = names(biomarker_levels),
  N_startpoints = 25,
  N_S_max = 8,
  N_iterations_MCMC = 100000L,
  output_folder = "output",
  dataset_name = "sample_data",
  use_parallel_startpoints = FALSE,
  seed = 1L,
  plot = FALSE,
  N_CV_folds = 0,
  CV_fold_nums = 1:N_CV_folds,
  verbose = TRUE,
  keep_data = TRUE,
  fig_size = c(10, 10),
  ...
)
```

## Arguments

- patient_data:

  patient biomarker data

- prob_correct:

  the probability of correctly classifying the underlying biomarker
  level: p(obs = true)

- prob_score:

  [array](https://rdrr.io/r/base/array.html) probability of each score
  for all subjects across all biomarkers

  - dim = number of subjects x number of biomarkers x number of scores

- score_vals:

  a matrix specifying the scores for each biomarker

  - dim: number of biomarkers x number of scores

- biomarker_levels:

  a list containing the levels for each biomarker

- SuStaInLabels:

  the names of the biomarkers as a list of strings

- N_startpoints:

  number of startpoints to use in maximum likelihood step of SuStaIn,
  typically 25

- N_S_max:

  maximum number of subtypes, should be 1 or more

- N_iterations_MCMC:

  number of MCMC iterations, typically 1e5 or 1e6 but can be lower for
  debugging

- output_folder:

  where to save pickle files, etc.

- dataset_name:

  for naming pickle files

- use_parallel_startpoints:

  boolean for whether or not to parallelize the maximum likelihood loop

- seed:

  random number seed for python code

- plot:

  [`logical()`](https://rdrr.io/r/base/logical.html) indicating whether
  to construct PVD plots via python subroutines

- N_CV_folds:

  number of cross-validation folds to create

- CV_fold_nums:

  which CV folds to run (for parallel processing)

- verbose:

  [`logical()`](https://rdrr.io/r/base/logical.html) indicating whether
  to print debugging information

- keep_data:

  [`logical()`](https://rdrr.io/r/base/logical.html) indicating whether
  to include the ata in the return object

- fig_size:

  python figure size, in inches (width, height)

- ...:

  additional arguments passed to the Python function
  `pySuStaIn$OrdinalSustain()`

## Value

a [`list()`](https://rdrr.io/r/base/list.html)
