clean_trax_ataxia <- function(data) {
  to_return <-
    data |>
    dplyr::mutate(

      `ataxia severity exam: missingness reasons` =
        .data$`ataxia severity exam` |> # nolint: indentation_linter
        missingness_reasons.numeric(),

      # setting missing codes as 0s:
      `ataxia severity exam` = dplyr::case_when(
        .data$`ataxia severity exam` %in% c("888", "999") ~ 0,
        TRUE ~ .data$`ataxia severity exam`
      ),

      `ataxia severity exam` =
        .data$`ataxia severity exam` |> # nolint: indentation_linter
        clean_numeric(),

      `ataxia exam` =
        if_else( # nolint: indentation_linter
          condition = (.data$`ataxia severity exam` %in% 0) &
            is.na(.data$`ataxia exam`),
          true = "No",
          false = .data$`ataxia exam`
        ) |>
        factor(levels = c("No", "Yes")),

      `ataxia severity exam` =
        if_else( # nolint: indentation_linter
          condition = (.data$`ataxia exam` %in% "No") &
            is.na(.data$`ataxia severity exam`),
          true = 0,
          false = .data$`ataxia severity exam`
        )
    )
  to_return <- to_return |>
    mutate(

      `ataxia severity*` =
        case_when(
          .data$`ataxia severity exam` == "2.5" ~ 2,
          TRUE ~ .data$`ataxia severity exam`
        ) |>
        factor()

    )
}
