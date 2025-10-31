# Format the demographics table as a flextable

Format the demographics table as a flextable

## Usage

``` r
format_demographics_table_as_flextable(x, ...)
```

## Arguments

- x:

  a
  [gtsummary::gtsummary](https://www.danieldsjoberg.com/gtsummary/reference/gtsummary-package.html)
  object

- ...:

  Arguments passed on to
  [`shared_flextable_settings`](https:/UCD-IDDRC.github.io/fxtas/preview/pr149/reference/shared_flextable_settings.md)

  `padding`

  :   controls `padding.top` and `padding.bottom` in
      [`flextable::padding()`](https://davidgohel.github.io/flextable/reference/padding.html)

## Value

a
[flextable::flextable](https://davidgohel.github.io/flextable/reference/flextable.html)
