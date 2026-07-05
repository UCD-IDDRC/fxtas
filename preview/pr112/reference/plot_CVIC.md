# Plot a CVIC curve

Plot a CVIC curve

## Usage

``` r
plot_CVIC(CVIC)
```

## Arguments

- CVIC:

  [`numeric()`](https://rdrr.io/r/base/numeric.html) vector of CVIC
  values, ordered by number of subtypes

## Value

a
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
cvic_sim_data$CVIC |> plot_CVIC()

```
