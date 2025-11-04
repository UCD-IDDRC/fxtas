# Report sex differences

Report sex differences

## Usage

``` r
report_sex_differences(table, cutoff = 0.05)
```

## Arguments

- table:

  output from
  [`make_biomarkers_table()`](https://UCD-IDDRC.github.io/fxtas/preview/pr82/reference/make_biomarkers_table.md)

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
#> [1] "\"Ataxia: severity\" (18% of females versus 30.2% of males, p-value = 0.114), \"Genu (CC)-WM Hyperintensity\" (64.3% of females versus 46.8% of males, p-value = 0.260), \"MRI: Cerebellar\" (85.7% of females versus 69% of males, p-value = 0.093), \"Splenium (CC)-WM Hyperintensity\" (47.6% of females versus 74% of males, p-value = 0.033), \"Hypothyroid\" (5% of females versus 14% of males, p-value = 0.177), \"head tremor\" (13.3% of females versus 32.6% of males, p-value = 0.060), \"Intermittent tremor\" (37.2% of females versus 27.3% of males, p-value = 0.198), and \"Resting tremor\" (16.3% of females versus 10.2% of males, p-value = 0.218)"
```
