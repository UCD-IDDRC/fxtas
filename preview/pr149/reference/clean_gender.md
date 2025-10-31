# Clean the variable `Gender`

This function attempts to add the label "chromosomal sex", but lots of
functions remove attributes, such as
[`droplevels()`](https://rdrr.io/r/base/droplevels.html)

## Usage

``` r
clean_gender(data)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

## Value

a modified version of `data`

## Examples

``` r
test_data |> clean_gender()
#> # A tibble: 686 × 469
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 GP3   155      GP3 - Visit… 2017-03-09                1           79.0 Male  
#>  2 GP3   241      GP3 - Visit… 2022-03-28               NA           55.6 Male  
#>  3 GP3   20       GP3 - Visit… 2015-04-06               NA           52   Male  
#>  4 Trax… 214      GP4 - Visit… 2021-07-13               NA           63.9 Male  
#>  5 GP3   207      GP4 - Visit… 2015-01-27               NA           66   Female
#>  6 Trax… 63       GP3 - Visit… 2013-02-11               NA           61.2 Male  
#>  7 GP4   127      GP3 - Visit… 2014-10-28                1           61   Male  
#>  8 GP3   198      GP3 - Visit… 2014-03-24               NA           73   Male  
#>  9 Trax… 21       GP4 - Visit… 2016-01-22                1           64.6 Female
#> 10 Trax… 221      Visit 2 (Ar… 2019-02-05                4           66.9 Male  
#> # ℹ 676 more rows
#> # ℹ 462 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left postural tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right postural tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
