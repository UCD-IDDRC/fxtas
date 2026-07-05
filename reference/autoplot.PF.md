# Create positional variance diagram (PVD)

Create positional variance diagram (PVD)

## Usage

``` r
# S3 method for class 'PF'
autoplot(object, size.y = 10, color_label = "Pr(stage)", ...)
```

## Arguments

- object:

  a "PF" object (created by `compute_position_frequencies()`)

- size.y:

  size of biomarker event labels

- color_label:

  label for legend color scale

- ...:

  not currently used

## Value

a "PVD" object (extends
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html))
