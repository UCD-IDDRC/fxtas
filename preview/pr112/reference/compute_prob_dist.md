# Computes `p(true | obs)`? for each biomarker

Includes a row for NAs, which are treated as uniformly distributed over
the possible true levels of the biomarker

## Usage

``` r
compute_prob_dist(biomarker_levels, prob_correct)
```

## Arguments

- biomarker_levels:

  a list containing the levels for each biomarker

- prob_correct:

  the probability of correctly classifying the underlying biomarker
  level: p(obs = true)

## Value

a [`list()`](https://rdrr.io/r/base/list.html) of confusion
[`matrix()`](https://rdrr.io/r/base/matrix.html) objects
