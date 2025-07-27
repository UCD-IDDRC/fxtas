#' Combine demographic data with latent subtype classifications
#'
#' @param patient_data a [data.frame] containing patient demographics
#' @param subtype_data a [data.frame]
#' @returns
#' @export
#'
#' @examples
combine_subtype_and_demos <- function(
    patient_data,
    subtype_data) {

  patient_data2 <- patient_data |>
    dplyr::rename(
    age = "Age at visit",
    id = "FXS ID",
    sex = "Gender"
  )
  subtype_data |>
    bind_cols(patient_data2)

}
