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
#> # A tibble: 49 × 7
#>    biomarker          biomarker_label biomarker_label_long level biomarker_level
#>  * <chr>              <chr>           <chr>                <int> <chr+lbl>      
#>  1 head tremor        head tremor     head tremor              2 head tre… [hea…
#>  2 intention tremor   intention trem… intention tremor         2 intentio… [int…
#>  3 resting tremor     resting tremor  resting tremor           2 resting … [res…
#>  4 postural tremor    postural tremor postural tremor          2 postural… [pos…
#>  5 intermittent trem… intermittent t… intermittent tremor      2 intermit… [int…
#>  6 Tandem Walk        tandem walk     tandem walk              2 Tandem W… [tan…
#>  7 ataxia severity*   ataxia severity ataxia severity          2 ataxia s… [ata…
#>  8 FXTAS Stage        FXTAS stage     FXTAS stage              2 FXTAS St… [FXT…
#>  9 parkinsonian feat… parkinsonian f… parkinsonian featur…     2 parkinso… [par…
#> 10 Parkinsons         Parkinson's di… Parkinson's disease      2 Parkinso… [Par…
#> # ℹ 39 more rows
#> # ℹ 2 more variables: level_labelled <chr>, levels <chr>
```
