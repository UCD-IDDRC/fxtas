# Extract levels from a set of variable names

Extract levels from a set of variable names

## Usage

``` r
get_levels(data, varnames = names(data), keep_labels = TRUE)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

- varnames:

  a [character](https://rdrr.io/r/base/character.html) specifying which
  columns of `data` to analyze

- keep_labels:

  [logical](https://rdrr.io/r/base/logical.html) whether to preserve
  variable labels from `data` in output

## Value

a [list](https://rdrr.io/r/base/list.html) of
[character](https://rdrr.io/r/base/character.html) vectors containing
the levels of the columns in `data` specified by `varnames`

## Examples

``` r
get_levels(iris, "Species")
```
