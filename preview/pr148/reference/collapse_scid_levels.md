# Collapse SCID domain levels

Collapse SCID domain levels

## Usage

``` r
collapse_scid_levels(dataset, ...)
```

## Arguments

- dataset:

  a
  [tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

- ...:

  Arguments passed on to
  [`collapse_scid_level`](https:/UCD-IDDRC.github.io/fxtas/preview/pr148/reference/collapse_scid_level.md)

  `x`

  :   a scid variable ([factor](https://rdrr.io/r/base/factor.html))

  `levels`

  :   [character](https://rdrr.io/r/base/character.html) string vector
      of levels to collapse

  `new_level`

  :   [character](https://rdrr.io/r/base/character.html) string for new
      collapsed level name

## Value

a modified version of `dataset`
