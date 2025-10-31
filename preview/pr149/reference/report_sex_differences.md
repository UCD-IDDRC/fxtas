# Report sex differences

Report sex differences

## Usage

``` r
report_sex_differences(table, cutoff = 0.05)
```

## Arguments

- table:

  output from
  [`make_biomarkers_table()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr149/reference/make_biomarkers_table.md)

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
  make_biomarker_events_table(
    biomarker_levels,
    biomarker_groups = biomarker_groups)

table = test_data_v1 |> make_biomarkers_table(
  biomarker_events_table = biomarker_events_table,
  biomarker_varnames = biomarker_varnames
  )

  table |> report_sex_differences(cutoff = 0.5)
#> [1] "\"ataxia severity\" (21.1% of females versus 33% of males, p-value = 0.105), \"Paired Associates Learning (PAL): total errors\" (69.8% of females versus 60% of males, p-value = 0.284), \"Corpus Callosum-Thickness\" (35% of females versus 46.2% of males, p-value = 0.454), \"Middle cerebellar peduncle (MCP): White Matter Hyperintensity\" (26.7% of females versus 36.8% of males, p-value = 0.376), \"Splenium (Corpus Callosum) White Matter Hyperintensity\" (76.2% of females versus 65.7% of males, p-value = 0.433), \"parkinsonian features\" (10.7% of females versus 19.9% of males, p-value = 0.158), \"mood disorders\" (63.3% of females versus 45.5% of males, p-value = 0.101), \"somatoform disorders\" (9.4% of females versus 4.6% of males, p-value = 0.383), \"Behavior Dyscontrol Scale - 2nd Edition (BDS-2): total score\" (25.8% of females versus 20.6% of males, p-value = 0.385), \"Mini-Mental State Examination (MMSE): total score\" (14.3% of females versus 8.2% of males, p-value = 0.408), \"Hyperthyroid\" (9.1% of females versus 2.6% of males, p-value = 0.075), \"autoimmune diagnoses or symptoms\" (21% of females versus 11.2% of males, p-value = 0.058), and \"resting tremor\" (12.3% of females versus 8% of males, p-value = 0.323)"
```
