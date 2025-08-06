#' Make biomarkers table
#'
#' @param biomarker_events_table [data.frame] from
#' [make_biomarker_events_table()]
#' @param data a [data.frame()] containing the columns specified by
#' `biomarker_varnames` as well as `stratifying_var_names`
#' @param biomarker_varnames a [character] vector matching a subset of
#' the column names in `data`
#' @param stratifying_var_names a [character] vector specifying
#' variables to stratify by
#' @param use_labels whether to use the biomarker labels or
#' the unlabelled biomarker variable names
#' @returns a [flextable::flextable()]
#' @export
#'
#' @example inst/examples/exm-make_biomarkers_table.R
#'
make_biomarkers_table <- function(
    data,
    biomarker_varnames =
      compile_biomarker_groups_table() |>
      dplyr::pull("biomarker"),
    biomarker_events_table,
    stratifying_var_names = "Gender",
    use_labels = TRUE
) {

  probs_above_baseline_by_gender <- compute_probs_above_baseline_by_gender(
    data,
    stratifying_var_names,
    biomarker_varnames
  )

  table_out <-
    biomarker_events_table |>
    dplyr::select(
      all_of(
        c(
          "category" = "biomarker_group",
          "biomarker",
          # "biomarker_label",
          "biomarker_label_long",
          "levels"
        )
      )
    ) |>
    slice_head(by = "biomarker") |>
    dplyr::filter(.data$category != "Stage") |>
    left_join(
      y = probs_above_baseline_by_gender,
      by = "biomarker",
      relationship = "one-to-one"
    ) |>
    dplyr::mutate(
      biomarker  = if (use_labels) .data$biomarker_label_long else .data$biomarker,
      biomarker_label_long = NULL,
      biomarker = .data$biomarker |>
        sub(
          pattern = "*",
          replacement = "",
          fixed = TRUE
        ) |>
        stringr::str_replace(
          stringr::fixed("SCID: "),
          ""
        )
    )

  table_out |>
    structure(class = union("biomarkers_table", class(table_out)))
}
