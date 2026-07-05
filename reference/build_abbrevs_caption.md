# Build abbreviations caption

Build abbreviations caption

## Usage

``` r
build_abbrevs_caption(abbreviations, abbreviations_to_define)
```

## Arguments

- abbreviations:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) loaded from
  `"inst/analyses/abbreviations.csv"`

- abbreviations_to_define:

  a [character](https://rdrr.io/r/base/character.html)
  [vector](https://rdrr.io/r/base/vector.html) indicating rows of
  `abbreviations` to use

## Value

a [character](https://rdrr.io/r/base/character.html) string

## Examples

``` r
if (FALSE) { # \dontrun{
abbreviations <- read.csv("inst/analyses/abbreviations.csv")

abbrevs_caption <- abbreviations |>
 build_abbrevs_caption(
   abbreviations_to_define = c(
     "SWM",
     "MRI"
   )
 )
} # }
```
