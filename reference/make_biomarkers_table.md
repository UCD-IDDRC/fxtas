# Make biomarkers table

Make biomarkers table

## Usage

``` r
make_biomarkers_table(
  data,
  biomarker_varnames = dplyr::pull(compile_biomarker_groups_table(), "biomarker"),
  biomarker_events_table,
  stratifying_var_names = "Gender",
  use_labels = TRUE
)
```

## Arguments

- data:

  a [`data.frame()`](https://rdrr.io/r/base/data.frame.html) containing
  the columns specified by `biomarker_varnames` as well as
  `stratifying_var_names`

- biomarker_varnames:

  a [character](https://rdrr.io/r/base/character.html) vector matching a
  subset of the column names in `data`

- biomarker_events_table:

  [data.frame](https://rdrr.io/r/base/data.frame.html) from
  [`make_biomarker_events_table()`](https://UCD-IDDRC.github.io/fxtas/reference/make_biomarker_events_table.md)

- stratifying_var_names:

  a [character](https://rdrr.io/r/base/character.html) vector specifying
  variables to stratify by

- use_labels:

  whether to use the biomarker labels or the unlabelled biomarker
  variable names

## Value

a
[`flextable::flextable()`](https://davidgohel.github.io/flextable/reference/flextable.html)

## Examples

``` r
biomarker_group_list <- list(
  "group 1" = c("Biomarker 1", "Biomarker 2"),
  "group 2" = c("Biomarker 3", "Biomarker 4"),
  "group 3" = "Biomarker 5"
)
biomarker_groups <- compile_biomarker_groups_table(
  dataset = sim_data,
  biomarker_group_list = biomarker_group_list
)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  sim_data |>
  get_levels(biomarker_varnames)

biomarker_events_table <-
  make_biomarker_events_table(
    biomarker_levels,
    biomarker_groups = biomarker_groups
  )

sim_data |> make_biomarkers_table(
  biomarker_events_table = biomarker_events_table,
  biomarker_varnames = biomarker_varnames,
  stratifying_var_names = "Sex"
)
#> # A tibble: 5 × 6
#>   category biomarker   levels     Male       Female     `p-value`
#> * <chr>    <chr>       <chr>      <formttbl> <formttbl>     <dbl>
#> 1 group 1  Biomarker 1 0, 1, 2    76.9%      75%            1    
#> 2 group 1  Biomarker 2 0, 1, 2    69.2%      83.3%          0.645
#> 3 group 2  Biomarker 3 0, 1       15.4%      25%            0.645
#> 4 group 2  Biomarker 4 0, 1, 2, 3 76.9%      75%            1    
#> 5 group 3  Biomarker 5 0, 1, 2, 3 76.9%      75%            1    
```
