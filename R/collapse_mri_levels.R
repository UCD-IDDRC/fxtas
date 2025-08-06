#' Collapse MRI levels
#'
#' @param dataset a [tibble::tbl_df]
#' @inheritDotParams collapse_mri_level
#'
#' @returns a modified version of `dataset`
#' @export
#'
collapse_mri_levels <- function(dataset, ...) {

  mri_vars <- c(
    "MCP-WM Hyperintensity",
    "MRI: Cerebellar",
    "MRI: Cerebral",
    "Splenium (CC)-WM Hyperintensity"
  )

  dataset |>
    mutate(
      across(
        .cols = any_of(mri_vars),
        .fns = collapse_mri_level
      )
    )

}

#' Collapse levels of a single MRI variable
#'
#' @param x a MRI variable ([factor])
#' @param levels [character] string vector of levels to collapse
#'
#' @returns a modified version of `x`
#' @export
#' @keywords internal
#'
collapse_mri_level <- function(x, levels = c("Moderate", "Severe")) {
  x |>
    forcats::fct_collapse(
      "Moderate/Severe" = levels
    )
}
