# Remove variable

Remove variable

## Usage

``` r
remove_missingness_reason_vars(vars)
```

## Arguments

- vars:

  a [`character()`](https://rdrr.io/r/base/character.html) vector

## Value

a modified version of input `vars`
([`character()`](https://rdrr.io/r/base/character.html)) with elements
ending in "missingness reasons" removed

## Examples

``` r
vars = c(
"parkinsonian features",
"parkinsonian features: missingness reasons")
vars |> remove_missingness_reason_vars()
#> [1] "parkinsonian features"
```
