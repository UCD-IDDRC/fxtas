# Plot estimated stage counts

Plot estimated stage counts

## Usage

``` r
# Default S3 method
stage_barplot(
  object,
  include_type_0 = TRUE,
  xmax = max(object$ml_stage, na.rm = TRUE),
  ...
)
```

## Arguments

- object:

  a `subtype_and_stage_table` object (a type of data.frame)

- include_type_0:

  [logical](https://rdrr.io/r/base/logical.html) whether to include Type
  0 in the plot

- xmax:

  largest x-value to display

- ...:

  unused

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
sim_subtype_and_stage_table |> stage_barplot()
```
