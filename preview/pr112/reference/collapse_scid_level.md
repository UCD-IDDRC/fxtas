# Collapse levels of a single scid variable

Collapse levels of a single scid variable

## Usage

``` r
collapse_scid_level(
  x,
  levels = c("Absent", "Sub-Threshold"),
  new_level = paste(levels, collapse = "/")
)
```

## Arguments

- x:

  a scid variable ([factor](https://rdrr.io/r/base/factor.html))

- levels:

  [character](https://rdrr.io/r/base/character.html) string vector of
  levels to collapse

- newlevel:

  [character](https://rdrr.io/r/base/character.html) string for new
  collapsed level name

## Value

a modified version of `x`
