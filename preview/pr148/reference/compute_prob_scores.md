# Compute probabilities of true biomarker levels

Compute probabilities of true biomarker levels

## Usage

``` r
compute_prob_scores(
  dataset,
  biomarker_levels,
  biomarker_varnames = names(biomarker_levels),
  ModelScores = compute_ModelScores(biomarker_levels),
  prob_dist = compute_prob_dist(biomarker_levels = biomarker_levels, ...),
  verbose = FALSE,
  ...
)
```

## Arguments

- dataset:

  a [`data.frame()`](https://rdrr.io/r/base/data.frame.html) containing
  biomarker data in columns and observations in rows; column names must
  include all the values of `biomarker_varnames`

- biomarker_levels:

  a list containing the levels for each biomarker

- biomarker_varnames:

  a [`character()`](https://rdrr.io/r/base/character.html) vector of
  biomarker variable names

- ModelScores:

  a vector of true score levels (max size among all biomarkers)

- prob_dist:

  a vector of probabilities of correctly classifying a biomarker level

- verbose:

  [`logical()`](https://rdrr.io/r/base/logical.html) indicating whether
  to print debugging information

- ...:

  Arguments passed on to
  [`compute_prob_dist`](https:/UCD-IDDRC.github.io/fxtas/preview/pr148/reference/compute_prob_dist.md)

  `prob_correct`

  :   the probability of correctly classifying the underlying biomarker
      level: p(obs = true)

## Value

an [array](https://rdrr.io/r/base/array.html)
