#' Collapse SCID domain levels
#'
#' @param dataset a [tibble::tbl_df]
#' @inheritDotParams collapse_scid_level
#'
#' @returns a modified version of `dataset`
#' @export
#'
collapse_scid_levels <- function(dataset, ...) {

  scid_vars <- c(
    "SCID: mood disorders",
    "SCID: substance use disorders",
    "SCID: anxiety disorders",
    "SCID: somatoform disorders",
    "SCID: psychotic symptoms"
  )

  dataset |>
    mutate(
      across(
        .cols = all_of(scid_vars),
        .fns = collapse_scid_level
      )
    )

}

#' Collapse levels of a single scid variable
#'
#' @param x a scid variable ([factor])
#' @param levels [character] string vector of levels to collapse
#'
#' @returns a modified version of `x`
#' @export
#' @keywords internal
#'
collapse_scid_level <- function(x, levels = c("Absent", "Sub-Threshold")) {
  x |>
    forcats::fct_collapse(
      "Absent/Sub-Threshold" =
    )

}
