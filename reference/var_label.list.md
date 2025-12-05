# Extract variable labels from a list object

Extract variable labels from a list object

## Usage

``` r
# S3 method for class 'list'
var_label(x, ...)
```

## Arguments

- x:

  a [list](https://rdrr.io/r/base/list.html)

- ...:

  not used

## Value

a named [character](https://rdrr.io/r/base/character.html)
[vector](https://rdrr.io/r/base/vector.html)

## Examples

``` r
output_folder <-
  fs::path_package("extdata/sim_data/", package = "fxtas")

biomarker_levels =
  output_folder |>
  fs::path("biomarker_levels.rds") |>
  readr::read_rds()

biomarker_levels |> var_label()
#> [1] "Biomarker 1" "Biomarker 2" "Biomarker 3" "Biomarker 4" "Biomarker 5"
```
