# Compute and paste counts and proportions

Compute and paste counts and proportions

## Usage

``` r
counts_and_pcts(x)
```

## Arguments

- x:

  a [vector](https://rdrr.io/r/base/vector.html)

## Value

a [character](https://rdrr.io/r/base/character.html) string

## Examples

``` r
x <- test_data$`ataxia severity*`
x |> counts_and_pcts()
#> 414 (69.6%)
#> 93 (15.6%)
#> 43 (7.2%)
#> 33 (5.5%)
#> 12 (2%)
```
