# Collapse MRI levels

Collapse MRI levels

## Usage

``` r
collapse_mri_levels(dataset, ...)
```

## Arguments

- dataset:

  a
  [tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

- ...:

  Arguments passed on to
  [`collapse_mri_level`](https://UCD-IDDRC.github.io/fxtas/reference/collapse_mri_level.md)

  `x`

  :   a MRI variable ([factor](https://rdrr.io/r/base/factor.html))

  `levels`

  :   [character](https://rdrr.io/r/base/character.html) string vector
      of levels to collapse

## Value

a modified version of `dataset`
