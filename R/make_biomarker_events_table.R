#' Construct biomarker events table
#'
#' @param biomarker_levels  todo
#' @param biomarker_groups todo
#'
#' @returns a [tibble::tbl_df]
#' @export
#' @example inst/examples/exm-make_biomarker_events_table.R
make_biomarker_events_table <- function(
  biomarker_levels,
  biomarker_groups
) {
  biomarker_events_table =
    biomarker_levels |>
    get_biomarker_events_table()

  biomarker_events_table |>
    left_join(
      biomarker_groups,
      by = "biomarker"
    ) |>
    arrange(
      across(
        all_of(
          c(
            "biomarker_group",
            "biomarker",
            "biomarker_level"
          )
        )
      )
    )
}
