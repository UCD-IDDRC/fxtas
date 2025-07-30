#' Add labels to biomarkers
#'
#' @param data a [data.frame] containing the relevant columns
#'
#' @returns a modified version of `data` with var labels added
#' @export
#'
#' @examples test_data |> add_labels()
add_labels <- function(data) {
  to_return <- data |>
    set_mri_var_labels() |>
    set_scid_labels() |>
    dplyr::mutate(
      `Masked faces` = .data$`Masked faces` |>
        set_label_attribute("masked facies"),
      # "faces" or "facies" both seem correct;
      # see https://www.ninds.nih.gov/health-information/clinical-trials/masked-faces-parkinson-disease-mechanism-and-treatment # nolint: line_length_linter
      "Increased tone" = .data$`Increased tone` |>
        set_label_attribute("increased tone"),
      "Stiff gait" = .data$`Stiff gait` |>
        set_label_attribute("stiff gait"),
      `FX3*` = .data$`FX3*` |>
        set_label_attribute("CGG repeat level"),
      Parkinsons = .data$Parkinsons |>
        set_label_attribute("Parkinson's disease"),
      `FXTAS Stage` = .data$`FXTAS Stage` |>
        set_label_attribute("FXTAS stage"),
      `ataxia severity*` = .data$`ataxia severity*` |>
        set_label_attribute("ataxia severity"),
      `MMSE total score*` = .data$`MMSE total score*` |>
        set_label_attribute("MMSE total score"),
      `BDS-2 Total Score*` = .data$`BDS-2 Total Score*` |>
        set_label_attribute("BDS-2 total score"),
      `BDS-2 Total Score` = .data$`BDS-2 Total Score` |>
        set_label_attribute("BDS-2 total score"),
      `PAL Total errors (adjusted)*` =
        .data$`PAL Total errors (adjusted)*` |>
        set_label_attribute("PAL total errors"),
      `SWM Between errors*` =
        .data$`SWM Between errors*` |>
        set_label_attribute("SWM between errors"),
      `RTI Five-choice movement time*` =
        .data$`RTI Five-choice movement time*` |>
        set_label_attribute(
          "RTI five-choice movement time"
        ),
      `Hypothyroid` =
        .data$`Hypothyroid` |>
        set_label_attribute("hypothyroid"),
      `Hyperthyroid` =
        .data$`Hyperthyroid` |>
        set_label_attribute("hyperthyroid"),
      `Tandem Walk` =
        .data$`Tandem Walk` |>
        set_label_attribute("tandem walk"),
      ataxia = .data$ataxia |> set_label_attribute("gait ataxia"),
      `ataxia severity` =
        .data$`ataxia severity` |>
        set_label_attribute("ataxia severity"),
      `head tremor` = .data$`head tremor` |> set_label_attribute("head tremor"),
      `Corpus Callosum-Thickness` =
        .data$`Corpus Callosum-Thickness` |>
        set_label_attribute("corpus callosum thickness"),
      `Genu (CC)-WM Hyperintensity` =
        .data$`Genu (CC)-WM Hyperintensity` |>
        set_label_attribute(
          "genu white matter hyperintensity"
        ),
      `Splenium (CC)-WM Hyperintensity` =
        .data$`Splenium (CC)-WM Hyperintensity` |>
        set_label_attribute(
          "splenium white matter hyperintensity"
        ),
      `MCP-WM Hyperintensity` =
        .data$`MCP-WM Hyperintensity` |>
        set_label_attribute("MCP white matter hyperintensity"),
      `any autoimmune disorder` =
        .data$`any autoimmune disorder` |>
        set_label_attribute("autoimmune diagnoses or symptoms"),

      `Activation Ratio (0.0-1.0)` =
        .data$`Activation Ratio (0.0-1.0)` |>
        set_label_attribute("activation ratio"),
      fxtas_dx =
        .data$fxtas_dx |>
        set_label_attribute("FXTAS diagnosis"),
      `Primary Race/Ethnicity` =
        .data$`Primary Race/Ethnicity` |>
        set_label_attribute("primary race/ethnicity"),
      Stage_3plus =
        .data$Stage_3plus |>
        labelled::set_label_attribute("FXTAS Stage")
    )
  to_return <- to_return |>
    add_default_labels()


}
