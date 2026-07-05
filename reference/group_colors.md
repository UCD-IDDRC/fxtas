# Extract group colors

Extract group colors

## Usage

``` r
group_colors(object)
```

## Arguments

- object:

  an object

## Value

a named [character](https://rdrr.io/r/base/character.html)
[vector](https://rdrr.io/r/base/vector.html) mapping from
`biomarker_group` to a color palette

## Examples

``` r
figs <- readr::read_rds(
 fs::path_package("fxtas", "extdata/sim_data/sim-figs-4.rds")
)
group_colors(figs)
#>             Tremors              Ataxia               Stage Parkinson's disease 
#>           "#88CCEE"           "#CC6677"             "black"           "#117733" 
#>                 MRI              Scores                SCID              CANTAB 
#>           "#332288"           "#AA4499"           "#44AA99"           "#999933" 
#>             Thyroid 
#>           "#888888" 
```
