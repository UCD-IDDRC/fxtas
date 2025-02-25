#' Construct biomarker events table
#'
#' @param biomarker_levels todo
#'
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
get_biomarker_events_table <- function(biomarker_levels) {
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
      biomarker_level =
        if_else(
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
    dplyr::filter(.data$level > 1) |>
    arrange(across(all_of(c("level", "biomarker"))))

  to_return
}

get_biomarker_event_names <- function(
    biomarker_levels,
    biomarker_events_table =
      get_biomarker_events_table(biomarker_levels)
) {
  biomarker_events_table |> dplyr::pull("biomarker_level")
}
