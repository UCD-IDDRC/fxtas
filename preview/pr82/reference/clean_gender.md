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
#> # A tibble: 687 × 430
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 GP3   225      Visit 1 (Ar… 2018-07-31               NA           59   Male  
#>  2 GP3   9        Visit 1 (Ar… 2022-03-30               NA           51   Female
#>  3 GP4   180      GP3 - Visit… 2017-10-12               NA           68.7 Female
#>  4 Trax… 145      GP4 - Visit… 2022-06-13                1           74.8 Male  
#>  5 Trax… 131      Visit 1 (Ar… 2021-12-13               NA           79.9 Female
#>  6 GP4   114      Visit 2 (Ar… 2019-06-17               NA           50   Female
#>  7 GP3   46       Visit 3 (Ar… 2017-04-10               NA           63.3 Male  
#>  8 Trax… 205      Visit 1 (Ar… 2012-06-26               NA           71.9 Male  
#>  9 GP3   266      GP4 - Visit… 2016-04-25               NA           68   Male  
#> 10 GP4   273      GP3 - Visit… 2013-10-04                1           59   Female
#> # ℹ 677 more rows
#> # ℹ 423 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left Postural Tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right Postural Tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
