# Combine demographic data with latent subtype classifications

was originally going to be more useful, but got reduced to spaghetti.
probably can be deleted

## Usage

``` r
combine_subtype_and_demos(patient_data, subtype_data)
```

## Arguments

- patient_data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) containing
  patient demographics

- subtype_data:

  a `SuSt_table` (produced as a list element by
  [`extract_results_from_pickle()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/extract_results_from_pickle.md))

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)
combining `patient_data` and `subtype_data` via
[`dplyr::bind_cols()`](https://dplyr.tidyverse.org/reference/bind_cols.html)
(assuming they were provided in the same row-order)

## Examples

``` r
sim_data |>
  dplyr::filter(Category == "Patient") |>
  combine_subtype_and_demos(
    subtype_data = sim_subtype_and_stage_table
  )
#> # A tibble: 20 × 16
#>    ml_subtype ml_stage prob_ml_subtype prob_ml_stage prob_subtype[,1]   [,2]
#>    <fct>         <dbl>           <dbl>         <dbl>            <dbl>  <dbl>
#>  1 Subtype 3         8           0.968        0.673            0.0166 0.0155
#>  2 Subtype 0         0           0.695        0.303            0.153  0.152 
#>  3 Subtype 3         6           0.973        0.763            0.0132 0.0141
#>  4 Subtype 3         6           0.973        0.763            0.0132 0.0141
#>  5 Subtype 3         6           0.973        0.763            0.0132 0.0141
#>  6 Subtype 3        10           0.350        0.0903           0.313  0.337 
#>  7 Subtype 3        11           0.436        0.123            0.286  0.278 
#>  8 Subtype 3        10           0.554        0.174            0.228  0.218 
#>  9 Subtype 3        10           0.480        0.132            0.260  0.261 
#> 10 Subtype 3         7           0.972        0.532            0.0152 0.0132
#> 11 Subtype 0         0           0.695        0.303            0.153  0.152 
#> 12 Subtype 3         6           0.973        0.763            0.0132 0.0141
#> 13 Subtype 3         6           0.973        0.763            0.0132 0.0141
#> 14 Subtype 1         6           0.419        0.205            0.419  0.386 
#> 15 Subtype 3         9           0.353        0.0702           0.323  0.324 
#> 16 Subtype 3         9           0.353        0.0702           0.323  0.324 
#> 17 Subtype 3         8           0.968        0.673            0.0166 0.0155
#> 18 Subtype 3         8           0.968        0.673            0.0166 0.0155
#> 19 Subtype 3         5           0.567        0.223            0.221  0.212 
#> 20 Subtype 3         5           0.648        0.175            0.174  0.179 
#> # ℹ 12 more variables: prob_subtype[3] <dbl>, ml_subtype_old <dbl>,
#> #   Index <dbl>, Category <chr>, Sex <chr>, Male <lgl>, Age <dbl>,
#> #   `Biomarker 1` <fct>, `Biomarker 2` <fct>, `Biomarker 3` <fct>,
#> #   `Biomarker 4` <fct>, `Biomarker 5` <fct>
```
