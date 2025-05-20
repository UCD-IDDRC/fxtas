#' Title
#'
#' @param likelihoods todo
#'
#' @returns a [tibble::tbl_df]
#' @export
#'

format_likelihoods <- function(likelihoods)
{
  n_subtypes <- ncol(likelihoods)
  colnames <-
    seq_len(n_subtypes) |>
    paste0(
      " subtype",
      if_else(
        seq_len(n_subtypes) == 1,
        "",
        "s"
      )
    )

  likelihoods |>
    magrittr::set_colnames(colnames) |>
    as_tibble() |>
    dplyr::mutate(Iteration = dplyr::row_number()) |>
    tidyr::pivot_longer(cols = all_of(colnames))
}
