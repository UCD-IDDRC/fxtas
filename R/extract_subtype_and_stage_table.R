extract_subtype_and_stage_table <- function( # nolint: object_length_linter
    results,
    n_s = get_n_subtypes(results),
    subtype_order = seq_len(n_s)) {

  subtype_order_with_0 <-
    c(0, subtype_order)

  subtype_map <-
    (0:n_s) |>
    setNames(subtype_order_with_0)

  to_return <- tibble(
    ml_subtype = results$ml_subtype[, 1] + 1,
    ml_stage = results$ml_stage[, 1],
    prob_ml_subtype = results$prob_ml_subtype[, 1],
    prob_ml_stage = results$prob_ml_stage[, 1],
    prob_subtype = results$prob_subtype[, subtype_order]
  ) |>
    dplyr::mutate(
      ml_subtype = if_else(
        .data$ml_stage == 0,
        0,
        .data$ml_subtype
      ),
      ml_subtype_old = .data$ml_subtype,
      ml_subtype = subtype_map[as.character(.data$ml_subtype)],
      ml_subtype =
        paste("Type", .data$ml_subtype) |>
        factor(
          levels = glue::glue("Type {0:n_s}")
        ) |>
        magrittr::set_attr("n_s", n_s)
    ) |>
    magrittr::set_attr("subtype_map", subtype_map)

  class(to_return) <- union("SuSt_table", class(to_return))

  return(to_return)

}
