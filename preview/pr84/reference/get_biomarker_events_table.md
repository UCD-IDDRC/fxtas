# Construct biomarker events table

Construct biomarker events table

## Usage

``` r
get_biomarker_events_table(biomarker_levels)
```

## Arguments

- biomarker_levels:

  todo

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
df <- test_data_v1
biomarker_groups <- compile_biomarker_groups_table(dataset = df)
biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  df |>
  get_levels(biomarker_varnames, keep_labels = TRUE)

get_biomarker_events_table(biomarker_levels)
#> # A tibble: 53 × 4
#>    biomarker                   level biomarker_level                      levels
#>    <chr>                       <int> <chr>                                <chr> 
#>  1 BDS-2 Total Score*              2 BDS-2 Total Score*: < 20             ≥ 20,…
#>  2 Corpus Callosum-Thickness       2 Corpus Callosum-Thickness: Thin      Norma…
#>  3 FXTAS Stage                     2 FXTAS Stage: 1                       0, 1,…
#>  4 Genu (CC)-WM Hyperintensity     2 Genu (CC)-WM Hyperintensity          No, Y…
#>  5 Hyperthyroid                    2 Hyperthyroid                         No, Y…
#>  6 Hypothyroid                     2 Hypothyroid                          No, Y…
#>  7 Increased tone                  2 Increased tone                       No, Y…
#>  8 MCP-WM Hyperintensity           2 MCP-WM Hyperintensity: Mild          None,…
#>  9 MMSE total score*               2 MMSE total score*: Mild impairment … Norma…
#> 10 MRI: Cerebellar                 2 MRI: Cerebellar: Mild                None,…
#> # ℹ 43 more rows
```
