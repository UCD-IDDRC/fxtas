# Title

Title

## Usage

``` r
missingness_reasons.numeric(x, x.clean = clean_numeric(x, ...), ...)
```

## Arguments

- x:

  the original vector to be turned into a numeric

- x.clean:

  the cleaned vector

- ...:

  Arguments passed on to
  [`clean_numeric`](https://UCD-IDDRC.github.io/fxtas/preview/pr112/reference/clean_numeric.md)

  `NA_codes`

  :   numeric values that should be turned into to NAs

  `extra_codes`

  :   codes besides 777, 888, 999 to turn into NAs; has no effect if the
      `NA_codes` argument is changed from default by the user.

## Value

a [factor](https://rdrr.io/r/base/factor.html)
[vector](https://rdrr.io/r/base/vector.html) corresponding to the
elements of `x`, indicating the reasons why `x` was missing.
