# Build a formula for [`table1::table1()`](https://rdrr.io/pkg/table1/man/table1.html)

Build a formula for
[`table1::table1()`](https://rdrr.io/pkg/table1/man/table1.html)

## Usage

``` r
stratified_formula(vars, strata)
```

## Arguments

- vars:

  row variables

- strata:

  column variables

## Value

a [`formula()`](https://rdrr.io/r/stats/formula.html) object

## Examples

``` r
stratified_formula(c("Sepal.Length" ,"Sepal.Width"), "Species")
#> ~Sepal.Length + Sepal.Width | Species
#> <environment: 0x5619091b55b0>
```
