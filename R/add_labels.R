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
        labelled::set_label_attribute("FXTAS Stage"),
      `gait ataxia severity*` = .data$`gait ataxia severity*` |>
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
        labelled::set_label_attribute("SWM Between errors"),
      `RTI Five-choice movement time*` =
        .data$`RTI Five-choice movement time*` |>
        labelled::set_label_attribute(
          "RTI Five-choice movement time"
        ),
      across(
        .cols = matches(" ?hx ?"),
        .fns =
          ~ set_label_attribute(
            .x,
            cur_column() |>
              stringr::str_replace(
                regex(" ?hx ?", ignore_case = TRUE),
                ""
              )
          )
      )


    ) |>
    set_mri_var_labels()
}
