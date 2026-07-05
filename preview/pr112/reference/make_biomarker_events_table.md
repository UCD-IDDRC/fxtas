# Construct biomarker events table

Construct biomarker events table

## Usage

``` r
make_biomarker_events_table(biomarker_levels, biomarker_groups)
```

## Arguments

- biomarker_levels:

  todo

- biomarker_groups:

  todo

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
biomarker_groups <- compile_biomarker_groups_table(
  dataset = test_data_v1
)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  test_data_v1 |>
  get_levels(biomarker_varnames)

make_biomarker_events_table(
  biomarker_levels,
  biomarker_groups
)
#> # A tibble: 49 × 6
#>    biomarker            level biomarker_level levels biomarker_group group_color
#>    <chr+lbl>            <int> <chr>           <chr>  <chr>           <chr>      
#>  1 Tandem Walk [tandem…     2 Tandem Walk: A… Norma… Ataxia          #BC8463    
#>  2 Tandem Walk [tandem…     3 Tandem Walk: U… Norma… Ataxia          #BC8463    
#>  3 ataxia severi… [ata…     2 ataxia severit… 0, 1,… Ataxia          #BC8463    
#>  4 ataxia severi… [ata…     3 ataxia severit… 0, 1,… Ataxia          #BC8463    
#>  5 ataxia severi… [ata…     4 ataxia severit… 0, 1,… Ataxia          #BC8463    
#>  6 ataxia severi… [ata…     5 ataxia severit… 0, 1,… Ataxia          #BC8463    
#>  7 PAL Total err… [PAL…     2 PAL Total erro… ≤ 13,… CANTAB          #A782C3    
#>  8 RTI Five-choi… [RTI…     2 RTI Five-choic… ≤ 368… CANTAB          #A782C3    
#>  9 SWM Between e… [SWM…     2 SWM Between er… ≤ 26,… CANTAB          #A782C3    
#> 10 Corpus Callos… [Cor…     2 Corpus Callosu… Norma… MRI             #00A396    
#> # ℹ 39 more rows
```
