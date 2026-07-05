# plot_compact_pvd: data prep

plot_compact_pvd: data prep

## Usage

``` r
compact_pvd_data_prep(
  figs,
  biomarker_order = NULL,
  biomarker_var = "biomarker_label"
)
```

## Arguments

- figs:

  a [list](https://rdrr.io/r/base/list.html) of `PVD` objects

- biomarker_order:

  a [character](https://rdrr.io/r/base/character.html) vector specifying
  the order of biomarkers to use

- biomarker_var:

  either "biomarker" or "biomarker_label"

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)
