# Get each participant's first visit in dataset

Get each participant's first visit in dataset

## Usage

``` r
get_visit1(dataset)
```

## Arguments

- dataset:

  a
  [tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)
  containing the following columns:

  - `FXS ID`: participant ID number
    ([`character()`](https://rdrr.io/r/base/character.html))

  - `Visit Date`: date of clinic visit
    ([`base::Date()`](https://rdrr.io/r/base/Dates.html))

  - `Event Name`: role of clinic visit in the study design
    ([`character()`](https://rdrr.io/r/base/character.html))

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
test_data |> get_visit1()
#> # A tibble: 312 × 468
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 GP4   1        GP3 - Visit… 2019-09-26                2           43.2 Male  
#>  2 GP4   10       Visit 3 (Ar… 2017-05-25               NA           69   Male  
#>  3 GP3   100      Visit 1 (Ar… 2016-05-23               NA           74.1 Male  
#>  4 Trax… 101      GP3 - Visit… 2019-06-26               NA           61.4 Male  
#>  5 GP4   102      GP4 - Visit… 2015-02-02                4           63.9 Male  
#>  6 Trax… 103      GP3 - Visit… 2021-09-16                1           77.8 Male  
#>  7 Trax… 104      GP4 - Visit… 2013-11-26               NA           65.2 Male  
#>  8 GP3   105      Visit 1 (Ar… 2013-09-09               NA           50.5 Female
#>  9 Trax… 106      Visit 3 (Ar… 2014-06-17               NA           61   Male  
#> 10 Trax… 107      Visit 1 (Ar… 2023-09-05               NA           71.4 Male  
#> # ℹ 302 more rows
#> # ℹ 461 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left postural tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right postural tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
