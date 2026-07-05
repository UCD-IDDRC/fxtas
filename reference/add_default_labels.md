# Add default variable labels

Add default variable labels

## Usage

``` r
add_default_labels(data)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

## Value

a modified version of `data`

## Examples

``` r
iris |>
  add_default_labels() |>
  labelled::var_label(unlist = TRUE)
#>   Sepal.Length    Sepal.Width   Petal.Length    Petal.Width        Species 
#> "Sepal.Length"  "Sepal.Width" "Petal.Length"  "Petal.Width"      "Species" 
```
