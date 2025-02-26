#' Create table of demographics statistics by most-likely latent subtype
#'
#' @param patient_data a [data.frame]
#' @param subtype_and_stage_table a [data.frame]
#' @param footnotes_as_letters [logical] whether to convert footnote
#' @param demographic_vars [character] varnames to compute statistics for
#' symbols to letters (TRUE) instead of numbers (FALSE)
#' @returns A [gtsummary::tbl_summary]
#' @export
#' @examples
#' patient_data = sim_data |>
#'   dplyr::filter(.data$Category == "Patient")
#' table = sim_subtype_and_stage_table
#' table_subtype_by_demographics(patient_data, table,
#'   demographic_vars = "Sex")
#' @inheritDotParams gtsummary::tbl_summary

table_subtype_by_demographics <- function(
    patient_data,
    subtype_and_stage_table,
    footnotes_as_letters = FALSE,
    demographic_vars = c(
      "CGG",
      "CGG 55-99",
      "Male",
      "Primary Race/Ethnicity"
    ),
    ...) {

  patient_data2 <-
    patient_data |>
    bind_cols(subtype_and_stage_table)

  to_return <-
    patient_data2 |>
    dplyr::filter(.data$ml_subtype != "Type 0") |>
    drop_levels() |>
    dplyr::select(
      all_of(
        c(
          "ml_subtype",
          demographic_vars)
      )
    ) |>
    gtsummary::tbl_summary(
      by = "ml_subtype",
      percent = "column", # revert back to column percentages
      statistic = list(
        gtsummary::all_continuous() ~ "{mean} ({sd})"
      ),
      missing_text = "Missing",
      ...
    ) |>
    gtsummary::bold_labels() |>

    gtsummary::add_p(
      pvalue_fun = function(x) gtsummary::style_number(x, digits = 3),
      test = list(CGG = "oneway.test"),
    ) |>
    gtsummary::add_stat_label(location = "row") |>
    gtsummary::add_overall() |>
    gtsummary::modify_footnote(
      gtsummary::all_stat_cols() ~ "n (column %)"
    ) |>
    gtsummary::separate_p_footnotes(
      footnote_prefix = "Group comparison was done by"
    )

  if (footnotes_as_letters) {
    to_return <- to_return |>
      gtsummary::as_gt() |>
      gt::opt_footnote_marks(marks = "letters")
  }

  return(to_return)

}
