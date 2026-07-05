# Replace missing codes with NAs

Replace missing codes with NAs

## Usage

``` r
replace_missing_codes_with_NAs(
  x,
  missing_codes = c("Unknown", "Unknown / Not Reported", "NA",
    "Missing (SCID not completed)", "Inadequate Info", "99", "777", "888", "999",
    "Asked by clinician, but no answer from subject (99)",
    "Question not asked at time of data entry; check records (777)",
    "Question not asked at time of data entry; check records", "NA (888)",
    "No Response (999)", "No Response", "No Data", "No Data (999)",
    "Missing/Refused (999)", "Missing (empty in RedCap)")
)
```

## Arguments

- x:

  a factor or character vector

- missing_codes:

  list of codes to replace with NAs

## Value

a factor vector similar to `x`, but with 99, 777, 888, 999, etc replaced
with `NA`s
