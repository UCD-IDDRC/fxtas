# Construct biomarker events table

Construct biomarker events table

## Usage

``` r
get_biomarker_events_table(biomarker_levels, do_factor = TRUE)
```

## Arguments

- biomarker_levels:

  todo

- do_factor:

  whether to turn `biomarker` column into factor and sort on it, after
  `level`

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
#>    biomarker             level biomarker_level                   levels         
#>    <chr>                 <int> <chr>                             <chr>          
#>  1 head tremor               2 head tremor                       No, Yes        
#>  2 intention tremor          2 intention tremor                  No, Yes        
#>  3 resting tremor            2 resting tremor                    No, Yes        
#>  4 postural tremor           2 postural tremor                   No, Yes        
#>  5 intermittent tremor       2 intermittent tremor               No, Yes        
#>  6 Tandem Walk               2 Tandem Walk: Abnormal (<10 steps) Normal, Abnorm…
#>  7 ataxia severity*          2 ataxia severity*: 1               0, 1, 2, 3, 4  
#>  8 FXTAS Stage               2 FXTAS Stage: 1                    0, 1, 2, 3, 4,…
#>  9 parkinsonian features     2 parkinsonian features             No, Yes        
#> 10 Parkinsons                2 Parkinsons                        No, Yes        
#> # ℹ 39 more rows
```
