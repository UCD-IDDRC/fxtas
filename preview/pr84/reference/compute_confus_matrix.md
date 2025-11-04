# compute `confus_matrix` as in python version

compute `confus_matrix` as in python version

## Usage

``` r
compute_confus_matrix(
  samples_sequence,
  biomarker_event_order = attr(samples_sequence, "biomarker_event_names")
)
```

## Arguments

- samples_sequence:

  todo

- biomarker_event_order:

  todo

## Value

a
[tibble::tbl_df](https://tibble.tidyverse.org/reference/tbl_df-class.html)

## Examples

``` r
samples_sequence = matrix(
   nrow = 2,
   byrow = TRUE,
   dimnames = list(
     iteration = NULL,
     position = paste("Event #", 1:10)),
   data = paste(
     "biomarker",
     c(0,2,4,6,8,9,7,5,3,1,
       0,1,2,3,4,5,6,7,8,9)))
compute_confus_matrix(samples_sequence)
#>              position
#> event name    Event # 1 Event # 2 Event # 3 Event # 4 Event # 5 Event # 6
#>   biomarker 0         1       0.0       0.0       0.0       0.0       0.0
#>   biomarker 1         0       0.5       0.0       0.0       0.0       0.0
#>   biomarker 2         0       0.5       0.5       0.0       0.0       0.0
#>   biomarker 4         0       0.0       0.5       0.0       0.5       0.0
#>   biomarker 3         0       0.0       0.0       0.5       0.0       0.0
#>   biomarker 6         0       0.0       0.0       0.5       0.0       0.0
#>   biomarker 8         0       0.0       0.0       0.0       0.5       0.0
#>   biomarker 5         0       0.0       0.0       0.0       0.0       0.5
#>   biomarker 9         0       0.0       0.0       0.0       0.0       0.5
#>   biomarker 7         0       0.0       0.0       0.0       0.0       0.0
#>              position
#> event name    Event # 7 Event # 8 Event # 9 Event # 10
#>   biomarker 0       0.0       0.0       0.0        0.0
#>   biomarker 1       0.0       0.0       0.0        0.5
#>   biomarker 2       0.0       0.0       0.0        0.0
#>   biomarker 4       0.0       0.0       0.0        0.0
#>   biomarker 3       0.0       0.0       0.5        0.0
#>   biomarker 6       0.5       0.0       0.0        0.0
#>   biomarker 8       0.0       0.0       0.5        0.0
#>   biomarker 5       0.0       0.5       0.0        0.0
#>   biomarker 9       0.0       0.0       0.0        0.5
#>   biomarker 7       0.5       0.5       0.0        0.0
```
