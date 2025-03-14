#' Clean `mol_act_ratio` variable from gp4
#'
#' @param x [character] the `mol_act_ratio` variable from gp4
#'
#' @returns a [numeric] version of `x`
#' @export
#'
#' @example inst/examples/exm-clean_mol_act_ratio.R
#'
clean_mol_act_ratio <- function(x) {
  x |>
    stringr::str_replace("\\*", "") |>
    dplyr::na_if("N/A") |>
    as.numeric()

}
