add_missing_labels <- function(data) {
  data |>
    set_variable_labels(
      .labels = get_variable_labels(data, null_action = "fill", unlist = TRUE)
    )
}
