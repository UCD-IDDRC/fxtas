extract_subtype_and_stage_table <- function(results) {

  py_discover_config(required_module = "pySuStaIn")$required_module_path |>
    is.null() |>
    skip_if()

  n_s = get_n_subtypes(results)

  tibble(
    ml_subtype = results$ml_subtype[,1] + 1,
    ml_stage = results$ml_stage[,1],
    prob_ml_subtype = results$prob_ml_subtype[,1],
    prob_ml_stage = results$prob_ml_stage[,1]
  ) |>
    dplyr::mutate(
      ml_subtype = if_else(
        .data$ml_stage == 0,
        0,
        .data$ml_subtype
      ),
      ml_subtype =
        paste("Type", .data$ml_subtype) |>
        factor(
          levels = glue::glue("Type {0:n_s}")
        ) |>
        magrittr::set_attr("n_s", n_s)
    )
}
