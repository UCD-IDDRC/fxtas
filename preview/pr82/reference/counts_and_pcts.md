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
x <- test_data$`Ataxia: severity*`
x |> counts_and_pcts()
#> 406 (69.2%)
#> 93 (15.8%)
#> 44 (7.5%)
#> 33 (5.6%)
#> 11 (1.9%)
```
