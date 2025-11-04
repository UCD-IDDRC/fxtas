# Categorize \`CGG“

Adds categorized versions of CGG to input dataset.

## Usage

``` r
define_cases_and_controls(dataset)
```

## Arguments

- dataset:

  a tibble containing a numeric variable named `CGG`

## Value

a tibble with the same columns as `dataset`, except with the following
additions:

- FX (logical): TRUE if CGG \>= 55

&nbsp;

- `FX*` (factor): dichotomizes CGG to \< 55 vs \>= 55; `NA`s stay as
  `NA`

- `FX**` (factor): dichotomizes CGG to \< 55 vs \>= 55; `NA`s converted
  to level `"CGG missing"`

- `FX3*` (factor): trichotomizes CGG to \< 55, 55-100, and \>100 \>= 55;
  `NA`s stay as NAs

- `FX3**` (factor): trichotomizes CGG to \< 55, 55-100, and \>100 \>=
  55; `NA`s converted to level "CGG missing"
