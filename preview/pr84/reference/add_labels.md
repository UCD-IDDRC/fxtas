# Add labels to biomarkers

Add labels to biomarkers

## Usage

``` r
add_labels(data)
```

## Arguments

- data:

  a [data.frame](https://rdrr.io/r/base/data.frame.html) containing the
  relevant columns

## Value

a modified version of `data` with var labels added

## Examples

``` r
test_data |> add_labels()
#> # A tibble: 686 × 459
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 Trax… 228      Visit 1 (Ar… 2022-03-23               NA           63.3 Male  
#>  2 Trax… 65       Visit 1 (Ar… 2013-11-26               NA           50   Male  
#>  3 GP3   9        GP4 - Visit… 2018-10-08                1           74   Male  
#>  4 Trax… 72       GP4 - Visit… 2015-01-05               NA           66   Male  
#>  5 Trax… 156      GP4 - Visit… 2019-05-22               NA           52   Male  
#>  6 GP4   20       Visit 1 (Ar… 2022-01-07               NA           66.4 Female
#>  7 GP3   125      GP4 - Visit… 2019-05-16               NA           61.7 Male  
#>  8 GP3   96       GP4 - Visit… 2019-04-09               NA           72   Female
#>  9 Trax… 8        GP3 - Visit… 2017-12-04               NA           54.3 Male  
#> 10 Trax… 115      GP4 - Visit… 2016-08-31                2           59.3 Male  
#> # ℹ 676 more rows
#> # ℹ 452 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left postural tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right postural tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
