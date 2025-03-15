#' Add labels to biomarkers
#'
#' @param data a [data.frame] containing the relevant columns
#'
#' @returns a modified version of `data` with var labels added
#' @export
#'
#' @examples test_data |> add_labels()
add_labels <- function(data) {
  data |>
    dplyr::mutate(
      `FX3*` = .data$`FX3*` |>
        labelled::set_label_attribute("CGG repeat level"),
      Parkinsons = .data$Parkinsons |>
        labelled::set_label_attribute("Parkinson's disease"),
      `FXTAS Stage` = .data$`FXTAS Stage` |>
        labelled::set_label_attribute("FXTAS stage"),
      `ataxia severity*` = .data$`ataxia severity*` |>
        labelled::set_label_attribute("Ataxia severity"),
      `MMSE total score*` = .data$`MMSE total score*` |>
        labelled::set_label_attribute("MMSE total score"),
      `BDS-2 Total Score*` = .data$`BDS-2 Total Score*` |>
        labelled::set_label_attribute("BDS-2 total score"),
      `BDS-2 Total Score` = .data$`BDS-2 Total Score` |>
        labelled::set_label_attribute("BDS-2 total score"),
      `PAL Total errors (adjusted)*` =
        .data$`PAL Total errors (adjusted)*` |>
        labelled::set_label_attribute("PAL total errors"),
      `SWM Between errors*` =
        .data$`SWM Between errors*` |>
        labelled::set_label_attribute("SWM between errors"),
      `RTI Five-choice movement time*` =
        .data$`RTI Five-choice movement time*` |>
        labelled::set_label_attribute(
          "RTI five-choice movement time"
        ),
      `Tandem Walk` =
        .data$`Tandem Walk` |>
        labelled::set_label_attribute("tandem walk"),
      ataxia = .data$ataxia |> set_label_attribute("gait ataxia"),
      `ataxia severity` =
        .data$`ataxia severity` |>
        set_label_attribute("ataxia severity"),
      `head tremor` = .data$`head tremor` |> set_label_attribute("head tremor"),
      `Corpus Callosum-Thickness` =
        .data$`Corpus Callosum-Thickness` |>
        set_label_attribute("Corpus callosum thickness"),
      `any autoimmune disorder` =
        .data$`any autoimmune disorder` |>
        set_label_attribute("autoimmune diagnoses or symptoms"),

      `Activation Ratio (0.0-1.0)` =
        .data$`Activation Ratio (0.0-1.0)` |>
        set_label_attribute("Activation ratio"),
      fxtas_dx = .data$fxtas_dx |>
        set_label_attribute("FXTAS diagnosis"),
      `Primary Race/Ethnicity` = .data$`Primary Race/Ethnicity` |>
        set_label_attribute("Primary race/ethnicity")
    ) |>
    set_mri_var_labels()
}
