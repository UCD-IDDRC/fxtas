label_hx_vars <- function(data) {
  data |>
    mutate(
      across(
        .cols = dplyr::matches(" ?hx ?"),
        .fns =
          ~ set_label_attribute(
            .x,
            cur_column() |>
              stringr::str_replace(
                regex(" ?hx ?", ignore_case = TRUE),
                ""
              )
          )
      )
    )
}
