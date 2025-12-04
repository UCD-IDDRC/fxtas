# Compute missingness reasons for a vector of factor variables

Compute missingness reasons for a vector of factor variables

## Usage

``` r
missingness_reasons.factor(x, x.clean = replace_missing_codes_with_NAs(x))
```

## Arguments

- x:

  the original vector

- x.clean:

  the cleaned vector

## Value

a vector containing the values of x corresponding to `NA`s in x.clean,
