# Clean `mol_act_ratio` variable from gp4

Clean `mol_act_ratio` variable from gp4

## Usage

``` r
clean_mol_act_ratio(x)
```

## Arguments

- x:

  [character](https://rdrr.io/r/base/character.html) the `mol_act_ratio`
  variable from gp4

## Value

a [numeric](https://rdrr.io/r/base/numeric.html) version of `x`

## Examples

``` r
mol_act_ratio <- c(NA, "0.19", "N/A", "0.9*")

mol_act_ratio |> clean_mol_act_ratio()
#> [1]   NA 0.19   NA 0.90
```
