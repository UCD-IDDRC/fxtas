#' Report sex differences
#'
#' @param table output from [make_biomarkers_table()]
#' @param cutoff [numeric()] p-value cutoff for significance
#' @returns a [character()] string
#' @export
#' @examples
#' biomarker_groups = compile_biomarker_groups_table(
#'    dataset = test_data_v1)
#'
#' biomarker_varnames =
#'   biomarker_groups |>
#'   dplyr::pull("biomarker")
#'
#' biomarker_levels =
#' test_data_v1 |>
#'   get_levels(biomarker_varnames)
#'
#' biomarker_events_table =
#'   construct_biomarker_events_table(
#'     biomarker_levels,
#'     biomarker_groups = biomarker_groups)
#'
#' table = test_data_v1 |> make_biomarkers_table(
#'   biomarker_events_table = biomarker_events_table,
#'   biomarker_varnames = biomarker_varnames
#'   )
#'
#'   table |> report_sex_differences(cutoff = 0.5)
#'
report_sex_differences <- function(table, cutoff = 0.05) {

  table |>
    dplyr::filter(.data$`p-value` < cutoff) |>
    dplyr::mutate(
      biomarker = .data$biomarker |>
        stringr::str_replace(
          "Increased tone",
          "parkinsonian increased tone"
        ) |>
        stringr::str_replace(
          "MMSE total score",
          paste(
            "Mini-Mental State Examination (MMSE) total score < 26",
            "(mild impairment or worse)"
          )
        ) |>

        stringr::str_replace(
          "SWM Between errors",
          "the CANTAB subtest of Spatial Working Memory (SWM) Between errors"
        ) |>
        stringr::str_replace("Head tremor", "head tremor"),

      p_val_formatted =
        .data$`p-value` |>
        scales::label_pvalue(
          prefix = paste(c("<", "=", ">"), "")
        )(),

      comparison = glue::glue(
        "\"{biomarker}\" ",
        "({Female} of females versus {Male} of males",
        ", p-value {p_val_formatted})"

      )
    ) |>
    dplyr::pull(.data$comparison) |>
    and::and()
}
