# Plot estimated stage counts

Plot estimated stage counts

## Usage

``` r
# S3 method for class 'SuStaIn_model'
stage_barplot(object, ...)
```

## Arguments

- object:

  a `SuStaIn_model` object

- ...:

  Arguments passed on to
  [`stage_barplot.default`](https:/UCD-IDDRC.github.io/fxtas/preview/pr148/reference/stage_barplot.default.md)

  `xmax`

  :   largest x-value to display

  `include_type_0`

  :   [logical](https://rdrr.io/r/base/logical.html) whether to include
      Type 0 in the plot

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

results <-
  extract_results_from_pickle(
    output_folder = output_path,
    use_rds = TRUE,
    n_s = 3
  )

results |>
  stage_barplot()
```
