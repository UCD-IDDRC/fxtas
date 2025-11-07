# demo table_subtype_by_demographics()

``` r
library(fxtas)
```

``` r
patient_data = sim_data |>
  dplyr::filter(.data$Category == "Patient")
table = sim_subtype_and_stage_table
tab1 <- table_subtype_by_demographics(
  patient_data, 
  table,
  demographic_vars = "Sex",
  footnotes_as_letters = FALSE) |> 
  gtsummary::as_flex_table(ref_symbols = letters)
tab1
```

[TABLE]

Table 1: test
