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
#> Error in dplyr::mutate(data, `Masked faces` = set_label_attribute(.data$`Masked faces`,     "masked facies"), `Increased tone` = set_label_attribute(.data$`Increased tone`,     "increased tone"), `Stiff gait` = set_label_attribute(.data$`Stiff gait`,     "stiff gait"), `FX3*` = set_label_attribute(.data$`FX3*`,     "CGG repeat level"), Parkinsons = set_label_attribute(.data$Parkinsons,     "Parkinson's disease"), `FXTAS Stage` = set_label_attribute(.data$`FXTAS Stage`,     "FXTAS stage"), `ataxia severity*` = set_label_attribute(.data$`ataxia severity*`,     "ataxia severity"), `MMSE total score*` = set_label_attribute(.data$`MMSE total score*`,     "MMSE total score"), `BDS-2 Total Score*` = set_label_attribute(.data$`BDS-2 Total Score*`,     "BDS-2 total score"), `BDS-2 Total Score` = set_label_attribute(.data$`BDS-2 Total Score`,     "BDS-2 total score"), `PAL Total errors (adjusted)*` = set_label_attribute(.data$`PAL Total errors (adjusted)*`,     "PAL total errors"), `SWM Between errors*` = set_label_attribute(.data$`SWM Between errors*`,     "SWM between errors"), `RTI Five-choice movement time*` = set_label_attribute(.data$`RTI Five-choice movement time*`,     "RTI five-choice movement time"), `Tandem Walk` = set_label_attribute(.data$`Tandem Walk`,     "tandem walk"), ataxia = set_label_attribute(.data$ataxia,     "gait ataxia"), `ataxia severity` = set_label_attribute(.data$`ataxia severity`,     "ataxia severity"), `head tremor` = set_label_attribute(.data$`head tremor`,     "head tremor"), `Corpus Callosum-Thickness` = set_label_attribute(.data$`Corpus Callosum-Thickness`,     "Corpus callosum thickness"), `any autoimmune disorder` = set_label_attribute(.data$`any autoimmune disorder`,     "autoimmune diagnoses or symptoms"), `Activation Ratio (0.0-1.0)` = set_label_attribute(.data$`Activation Ratio (0.0-1.0)`,     "Activation ratio"), fxtas_dx = set_label_attribute(.data$fxtas_dx,     "FXTAS diagnosis"), `Primary Race/Ethnicity` = set_label_attribute(.data$`Primary Race/Ethnicity`,     "Primary race/ethnicity"), Stage_3plus = labelled::set_label_attribute(.data$Stage_3plus,     "FXTAS Stage")): ℹ In argument: `Stage_3plus =
#>   labelled::set_label_attribute(.data$Stage_3plus, "FXTAS Stage")`.
#> Caused by error in `.data$Stage_3plus`:
#> ! Column `Stage_3plus` not found in `.data`.
```
