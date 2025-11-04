# Clean a Numeric Variable

Replace missing codes (e.g., 777, 888, 999) with NAs in a numeric
variable

## Usage

``` r
clean_numeric(x, NA_codes = c(777, 888, 999, extra_codes), extra_codes = NULL)
```

## Arguments

- x:

  a numeric vector

- NA_codes:

  numeric values that should be turned into to NAs

- extra_codes:

  codes besides 777, 888, 999 to turn into NAs; has no effect if the
  `NA_codes` argument is changed from default by the user.

## Value

a [numeric](https://rdrr.io/r/base/numeric.html) vector corresponding to
`x`
