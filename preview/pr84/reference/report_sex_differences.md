# Report sex differences

Report sex differences

## Usage

``` r
report_sex_differences(table, cutoff = 0.05)
```

## Arguments

- table:

  output from
  [`make_biomarkers_table()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/make_biomarkers_table.md)

- cutoff:

  [`numeric()`](https://rdrr.io/r/base/numeric.html) p-value cutoff for
  significance

## Value

a [`character()`](https://rdrr.io/r/base/character.html) string

## Examples

``` r
biomarker_groups = compile_biomarker_groups_table(
   dataset = test_data_v1)

biomarker_varnames =
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels =
test_data_v1 |>
  get_levels(biomarker_varnames)

biomarker_events_table =
  construct_biomarker_events_table(
    biomarker_levels,
    biomarker_groups = biomarker_groups)

table = test_data_v1 |> make_biomarkers_table(
  biomarker_events_table = biomarker_events_table,
  biomarker_varnames = biomarker_varnames
  )

  table |> report_sex_differences(cutoff = 0.5)
#> [1] "\"Tandem Walk\" (50% of females versus 63.2% of males, p-value = 0.223), \"ataxia severity\" (23% of females versus 28.8% of males, p-value = 0.419), \"RTI Five-choice movement time\" (25% of females versus 33.1% of males, p-value = 0.412), \"Genu (CC)-WM Hyperintensity\" (60% of females versus 44.3% of males, p-value = 0.303), \"MRI: Cerebellar\" (88.9% of females versus 61% of males, p-value = 0.028), \"MRI: Cerebral\" (96.7% of females versus 87.8% of males, p-value = 0.290), \"Masked faces\" (2.2% of females versus 6.5% of males, p-value = 0.469), \"parkinsonian features\" (3.8% of females versus 19.4% of males, p-value = 0.072), \"anxiety disorders\" (74.1% of females versus 65.6% of males, p-value = 0.499), \"Hypothyroid\" (14.3% of females versus 10.1% of males, p-value = 0.437), and \"intermittent tremor\" (34% of females versus 25% of males, p-value = 0.218)"
```
