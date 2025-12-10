#' Title
#'
#' @param likelihoods todo
#'
#' @returns a [tibble::tbl_df]
#' @export
#'

format_likelihoods <- function(likelihoods) {
  n_subtypes <- ncol(likelihoods)
  colnames <-
    seq_len(n_subtypes) |>
    as.character()

  likelihoods |>
    magrittr::set_colnames(colnames) |>
    as_tibble() |>
    dplyr::mutate(Iteration = dplyr::row_number()) |>
    tidyr::pivot_longer(cols = all_of(colnames)) |>
    dplyr::mutate(
      n_subtypes = .data$name,
      name = .data$name |>
        paste0(
          " subtype",
          if_else(
            .data$name == "1",
            "",
            "s"
          )
        )
    )
}
