# Print method for `biomarkers_table`

Print method for `biomarkers_table`

## Usage

``` r
flex_biomarkers_table(
  x,
  width_biomarkers = 1.5,
  width_levels = 1.45,
  use_group_colors = TRUE
)
```

## Arguments

- x:

  a "biomarkers_table" object from
  [`make_biomarkers_table()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr149/reference/make_biomarkers_table.md)

- width_biomarkers:

  [numeric](https://rdrr.io/r/base/numeric.html): width for `Symptom`
  column

- width_levels:

  [numeric](https://rdrr.io/r/base/numeric.html): width for "Defined
  Ordered Levels" column

- use_group_colors:

  [logical](https://rdrr.io/r/base/logical.html) whether to use text
  colors to represent categories

## Value

a
[`flextable::flextable()`](https://davidgohel.github.io/flextable/reference/flextable.html)
