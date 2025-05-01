#' Construct biomarker events table
#'
#' @param biomarker_levels todo
#' @param do_factor whether to turn `biomarker` column into factor and sort on it, after `level`
#' @returns a [tibble::tbl_df]
#' @export
#' @examples
#' df <- test_data_v1
#' biomarker_groups <- compile_biomarker_groups_table(dataset = df)
#' biomarker_varnames <-
#'   biomarker_groups |>
#'   dplyr::pull("biomarker")
#'
#' biomarker_levels <-
#'   df |>
#'   get_levels(biomarker_varnames, keep_labels = TRUE)
#'
#' get_biomarker_events_table(biomarker_levels)
get_biomarker_events_table <- function(biomarker_levels, do_factor = TRUE) {
  to_return <-
    biomarker_levels |>
    tibble::enframe() |>
    tidyr::unnest_longer("value") |>
    dplyr::rename(
      biomarker = "name",
      level = "value"
    ) |>
    dplyr::relocate("biomarker", .before = everything()) |>
    dplyr::mutate(
      biomarker_level = if_else(
        .data$level == "Yes",
        .data$biomarker,
        .data$biomarker |> paste(.data$level, sep = ": ")
      )
    ) |>
    dplyr::mutate(
      .by = "biomarker",
      levels = paste(.data$level, collapse = ", "),
      level = dplyr::row_number()
    ) |>
    dplyr::filter(.data$level > 1)

  if (do_factor) {
    to_return <- to_return |>
    dplyr::mutate(
      biomarker = .data$biomarker |> factor(levels = names(biomarker_levels))
    ) |>
      arrange(across(all_of(c("level", "biomarker")))) |>
      dplyr::mutate(
        biomarker = .data$biomarker |> as.character()
      )


  } else
  {
    to_return <- to_return |>
      arrange(across(all_of(c("level"))))
  }

  to_return
}
