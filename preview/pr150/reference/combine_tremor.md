# Combine exam and history tremor vars

Tremor variables have TWO versions: "ne_tremor" and "neu_tremor" ne =
Neurological Exam, neu = Neurological History Here, we create a new
Tremor variable that takes the more severe score (e.g. Yes)

## Usage

``` r
combine_tremor(
  dataset,
  tremor_vars = c("intention tremor hx", "resting tremor hx", "postural tremor hx",
    "intention tremor exam", "resting tremor exam", "postural tremor exam",
    "head tremor hx", "head tremor exam")
)
```

## Arguments

- dataset:

  [data.frame](https://rdrr.io/r/base/data.frame.html)

- tremor_vars:

  [character](https://rdrr.io/r/base/character.html)
  [vector](https://rdrr.io/r/base/vector.html)

## Value

a modified version of `dataset`

## Examples

``` r
if (FALSE) { # \dontrun{
test_data |> combine_tremor()
} # }
```
