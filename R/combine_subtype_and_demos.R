#' Combine demographic data with latent subtype classifications
#'
#' @description
#' was originally going to be more useful, but got reduced to spaghetti.
#' probably can be deleted
#'
#' @param patient_data a [data.frame] containing patient demographics
#' @param subtype_data a `SuSt_table`
#' (produced as a list element by [extract_results_from_pickle()])
#' @returns a [tibble::tbl_df] combining `patient_data` and `subtype_data`
#' via [dplyr::bind_cols()]
#' (assuming they were provided in the same row-order)
#' @export
#' @keywords internal
#' @example inst/examples/exm-combine_subtype_and_demos.R
combine_subtype_and_demos <- function(
    patient_data,
    subtype_data) {

  subtype_data |>
    bind_cols(patient_data)

}
