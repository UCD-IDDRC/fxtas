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
#> # A tibble: 313 × 431
#>    Study `FXS ID` `Event Name` `Visit Date` `Visit Number` `Age at visit` Gender
#>    <chr> <chr>    <fct>        <date>                <int>          <dbl> <fct> 
#>  1 GP4   1        GP3 - Visit… 2022-02-03                3           51.9 Male  
#>  2 GP4   10       Visit 2 (Ar… 2008-07-07               NA           67   Female
#>  3 GP4   100      GP4 - Visit… 2019-06-26               NA           53.9 Male  
#>  4 Trax… 101      GP4 - Visit… 2013-03-11               NA           41.1 Male  
#>  5 Trax… 102      Visit 2 (Ar… 2023-10-05               NA           47   Female
#>  6 GP4   103      GP3 - Visit… 2019-09-03                1           60.3 Male  
#>  7 Trax… 104      GP4 - Visit… 2013-09-27               NA           77.4 Female
#>  8 Trax… 105      GP4 - Visit… 2016-06-20                2           84.7 Male  
#>  9 Trax… 106      GP3 - Visit… 2022-09-22               NA           68.1 Female
#> 10 GP4   107      GP4 - Visit… 2017-04-10                2           78.1 Male  
#> # ℹ 303 more rows
#> # ℹ 424 more variables: `Primary Race` <fct>, `Primary Ethnicity` <fct>,
#> #   `FMR1 Category` <fct>, `Education Level` <fct>, `Years of Education` <dbl>,
#> #   `Kinesia Left Kinetic Tremor` <dbl>, `Kinesia Left Postural Tremor` <dbl>,
#> #   `Kinesia Left Rest Tremor` <dbl>, `Kinesia Right Kinetic Tremor` <dbl>,
#> #   `Kinesia Right Postural Tremor` <dbl>, `Kinesia Right Rest Tremor` <dbl>,
#> #   `Current Medications 1` <chr>, `Current Medications 10` <chr>, …
```
