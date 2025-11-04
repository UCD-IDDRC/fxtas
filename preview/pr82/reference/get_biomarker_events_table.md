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
#> # A tibble: 49 × 4
#>    biomarker                   level biomarker_level                 levels     
#>    <chr>                       <int> <chr>                           <chr>      
#>  1 Ataxia                          2 Ataxia                          No, Yes    
#>  2 Ataxia: severity*               2 Ataxia: severity*: 1            0, 1, 2, 3…
#>  3 BDS-2 Total Score*              2 BDS-2 Total Score*: < 20        ≥ 20, < 20 
#>  4 Corpus Callosum-Thickness       2 Corpus Callosum-Thickness: Thin Normal, Th…
#>  5 FXTAS Stage                     2 FXTAS Stage: 1                  0, 1, 2, 3…
#>  6 Genu (CC)-WM Hyperintensity     2 Genu (CC)-WM Hyperintensity     No, Yes    
#>  7 Head tremor                     2 Head tremor                     No, Yes    
#>  8 Hyperthyroid                    2 Hyperthyroid                    No, Yes    
#>  9 Hypothyroid                     2 Hypothyroid                     No, Yes    
#> 10 Increased tone                  2 Increased tone                  No, Yes    
#> # ℹ 39 more rows
```
