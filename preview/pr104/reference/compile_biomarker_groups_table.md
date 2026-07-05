# Compile biomarker groups table

Compile biomarker groups table

## Usage

``` r
compile_biomarker_groups_table(
  dataset,
  biomarker_group_list = compile_biomarker_group_list(dataset = dataset, ...),
  colors = choose_biomarker_group_colors(biomarker_group_list),
  ...
)
```

## Arguments

- dataset:

  passed to
  [`compile_biomarker_group_list()`](https://UCD-IDDRC.github.io/fxtas/preview/pr104/reference/compile_biomarker_group_list.md)

- biomarker_group_list:

  todo

- colors:

  which colors to use

- ...:

  Arguments passed on to
  [`compile_biomarker_group_list`](https://UCD-IDDRC.github.io/fxtas/preview/pr104/reference/compile_biomarker_group_list.md)

  :   

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
biomarker_group_list = list(
  "group 1" = c("Biomarker 1", "Biomarker 2"),
  "group 2" = c("Biomarker 3", "Biomarker 4"),
  "group 3" = "Biomarker 5")

compile_biomarker_groups_table(
   dataset = sim_data,
   biomarker_group_list = biomarker_group_list)
#> # A tibble: 5 × 3
#>   biomarker   biomarker_group group_color
#>   <chr>       <chr>           <chr>      
#> 1 Biomarker 1 group 1         #C87A8A    
#> 2 Biomarker 2 group 1         #C87A8A    
#> 3 Biomarker 3 group 2         #6B9D59    
#> 4 Biomarker 4 group 2         #6B9D59    
#> 5 Biomarker 5 group 3         #5F96C2    
```
