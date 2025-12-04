# Title

possibly not needed; keeping because it has an example of using
attributes that I want to propagate across the codebase

## Usage

``` r
model_dists(
  df,
  biomarker_varnames = attr(df, "biomarker_varnames"),
  biomarker_levels = lapply(df[, biomarker_varnames], FUN = levels),
  nlevs = sapply(biomarker_levels, length)
)
```

## Arguments

- df:

  todo

- biomarker_varnames:

  todo

- biomarker_levels:

  todo

- nlevs:

  todo

## Value

a [`matrix()`](https://rdrr.io/r/base/matrix.html) indicating which
levels each biomarker has
