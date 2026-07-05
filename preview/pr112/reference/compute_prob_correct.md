# Compute each biomarker's probability of being recorded at its baseline level

Compute each biomarker's probability of being recorded at its baseline
level

## Usage

``` r
compute_prob_correct(dataset, biomarker_levels, max_prob = 1)
```

## Arguments

- dataset:

  a [`data.frame()`](https://rdrr.io/r/base/data.frame.html); should be
  just control data

- biomarker_levels:

  a list containing the levels of each biomarker

- max_prob:

  a maximum value for the baseline probability

## Value

a [`structure()`](https://rdrr.io/r/base/structure.html) that is
fundamentally a named [`numeric()`](https://rdrr.io/r/base/numeric.html)
vector corresponding to the elements of `biomarker_levels`, but also
contains a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)
as attribute `data` (easier than fixing all uses of this function)

## Examples

``` r
require(dplyr)
#> Loading required package: dplyr
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
full_data <- sim_data
biomarker_group_list = list(
    "group 1" = c("Biomarker 1", "Biomarker 2"),
   "group 2" = c("Biomarker 3", "Biomarker 4"),
  "group 3" = "Biomarker 5"
  )
biomarker_groups <- compile_biomarker_groups_table(
dataset = full_data,
biomarker_group_list = biomarker_group_list)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  full_data |>
  get_levels(biomarker_varnames)

control_data <-
  full_data |>
  dplyr::filter(Category == "Patient") |>
  dplyr::select(all_of(biomarker_varnames))

control_data |>
  compute_prob_correct(
    max_prob = .95,
    biomarker_levels = biomarker_levels
  ) |>
  attr("data")
#> # A tibble: 5 × 5
#>   Symptom     `# controls with data` `# at baseline` `% at baseline`
#>   <chr>                        <int>           <int> <chr>          
#> 1 Biomarker 1                     20               2 10%            
#> 2 Biomarker 2                     20               2 10%            
#> 3 Biomarker 3                     20              16 80%            
#> 4 Biomarker 4                     20               2 10%            
#> 5 Biomarker 5                     20               2 10%            
#> # ℹ 1 more variable: `Est. Pr(correct)` <chr>
```
