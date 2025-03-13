clean_ataxia <- function(data) {
  to_return <-
    data |>
    dplyr::mutate(

      "Ataxia severity: missingness reasons" =
        missingness_reasons.numeric(.data$`gait ataxia severity exam`),

      # setting missing codes as 0s:
      "gait ataxia severity exam" =
        dplyr::if_else(
          condition = .data$`gait ataxia severity exam` %in% c(777, 888, 999),
          true = 0,
          false = .data$`gait ataxia severity exam`
        ) |>
        clean_numeric(),

      "gait ataxia severity hx" =
        dplyr::if_else(
          condition = .data$`gait ataxia severity hx` %in% c(777, 888, 999),
          true = 0,
          false = .data$`gait ataxia severity hx`
        ) |>
        clean_numeric()
      ) |>
    combine_history_and_exam("gait ataxia severity")

  to_return <-
    to_return |>
    combine_history_and_exam("gait ataxia") |>
    mutate(
      "gait ataxia" =
        if_else(
          condition = (.data$`gait ataxia severity` %in% 0) &
            is.na(.data$`gait ataxia`),
          true = "No",
          false = .data$`gait ataxia`
        ) |>
        factor(levels = c("No", "Yes")),

      "gait ataxia severity" =
        if_else(
          condition = (.data$`gait ataxia` %in% "No") &
            is.na(.data$`gait ataxia severity`),
          true = 0,
          false = .data$`gait ataxia severity`
        ),

      "gait ataxia severity*" =
        .data$`gait ataxia severity` |>
        factor()

    )
}
