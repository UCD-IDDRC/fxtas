format_ml_subtype <- function(
    ml_subtype,
    ml_stage,
    n_subtypes,
    subtype_order = seq_len(n_subtypes)) {

  subtype_order_with_0 <-
    c(0, subtype_order)

  subtype_map <-
    (0:n_subtypes) |>
    setNames(subtype_order_with_0)

  ml_subtype <- ml_subtype + 1
  ml_subtype <- if_else(
    ml_stage == 0,
    0,
    ml_subtype
  )

  ml_subtype <- subtype_map[as.character(ml_subtype)]
  ml_subtype <-
    paste("Type", ml_subtype) |>
    factor(
      levels = glue::glue("Type {0:n_subtypes}")
    ) |>
    magrittr::set_attr("n_s", n_subtypes) |>
    magrittr::set_attr("subtype_map", subtype_map)
  return(ml_subtype)
}
