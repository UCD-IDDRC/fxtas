# compute p-values by gender
compute_pvals <- function(
    data,
    biomarker_varnames,
    stratifying_var_names) {
  pvals <- numeric()

  for (cur in biomarker_varnames) {
    pvals[cur] <-
      data |>
      dplyr::mutate(
        above_baseline = .data[[cur]] != levels(.data[[cur]])[1]
      ) |>
      dplyr::select(all_of(c("above_baseline", stratifying_var_names))) |>
      table() |>
      fisher.test() |>
      magrittr::use_series("p.value")
  }
  return(pvals)
}
