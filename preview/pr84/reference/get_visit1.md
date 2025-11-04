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
#> # A tibble: 312 × 460
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 Trax… 1        Visit 1 (Ar… 2023-06-26               NA           68.2 Male  
#>  2 GP4   10       Visit 3 (Ar… 2015-11-03                1           66   Male  
#>  3 GP4   100      Visit 1 (Ar… 2019-08-01                2           58   Male  
#>  4 Trax… 101      Visit 2 (Ar… NA                       NA           69   Male  
#>  5 Trax… 102      GP4 - Visit… 2015-01-23                1           64.3 Male  
#>  6 GP4   103      GP3 - Visit… 2017-01-19                1           69.1 Male  
#>  7 GP3   104      GP3 - Visit… 2015-02-26               NA           50.7 Female
#>  8 GP3   105      GP4 - Visit… 2018-01-18                2           67.9 Male  
#>  9 Trax… 106      GP4 - Visit… 2013-10-10               NA           74.1 Male  
#> 10 GP4   107      Visit 2 (Ar… 2019-02-21               NA           74   Female
#> # ℹ 302 more rows
#> # ℹ 453 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left postural tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right postural tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
