# Barplot of CGG repeats

Barplot of CGG repeats

## Usage

``` r
graph_CGG_repeats(data, rows = NULL, cols = NULL, include_200_cutoff = FALSE)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) containing a
  [numeric](https://rdrr.io/r/base/numeric.html) or
  [integer](https://rdrr.io/r/base/integer.html) column named `CGG`

- rows, cols:

  A set of variables or expressions quoted by
  [`vars()`](https://ggplot2.tidyverse.org/reference/vars.html) and
  defining faceting groups on the rows or columns dimension. The
  variables can be named (the names are passed to `labeller`).

  For compatibility with the classic interface, `rows` can also be a
  formula with the rows (of the tabular display) on the LHS and the
  columns (of the tabular display) on the RHS; the dot in the formula is
  used to indicate there should be no faceting on this dimension (either
  row or column).

- include_200_cutoff:

  whether to include the `CGG = 200` cutoff

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)
object

## Examples

``` r
test_data_v1 |> graph_CGG_repeats()

test_data_v1 |> graph_CGG_repeats(cols = ggplot2::vars(Gender))
```
