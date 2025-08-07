#' Summary method for `permutation_test` objects
#'
#' @param object a `permutation_test` object (from [permutation_test()])
#' @param N sample size of underlying data
#' @param digits how many digits to round the test statistic
#' @param ... unused
#'
#' @returns a [glue::glue] string
#' @export
#'
#' @example inst/examples/exm-summary.permutation_test.R
summary.permutation_test <- function(
    object,
    N,
    digits = 2,
    ...) {

  test_stat <- object |>
    attr("observed_test_stat") |>
    round(digits)
  pval <- object |>
    scales::label_pvalue(
      prefix = c(" < ", " = ", " > "),
      add_p = FALSE
    )()
  glue::glue(
    "Permutation test statistic (log-likelihood): ",
    "{test_stat}; ",
    "p-value {pval} ",
    "(N = {N} premutation carriers)."
  )
}
