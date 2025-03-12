clean_ataxia <- function(data) {
  data |>
    dplyr::mutate(

      "Ataxia severity: missingness reasons" =
        missingness_reasons.numeric(.data$`Gait ataxia severity`),

      # setting missing codes as 0s:
      "Gait ataxia severity" =
        dplyr::if_else(
          condition = .data$`Gait ataxia severity` %in% c(888, 999),
          true = 0,
          false = .data$`Gait ataxia severity`
        ),

      "Gait ataxia severity" =
        .data$`Gait ataxia severity` |>
        clean_numeric(),

      "Gait ataxia" =
        if_else(
          condition = (.data$`Gait ataxia severity` %in% 0) &
            is.na(.data$`Gait ataxia`),
          true = "No",
          false = .data$`Gait ataxia`
        ) |>
        factor(levels = c("No", "Yes")),

      "Gait ataxia severity" =
        if_else(
          condition = (.data$`Gait ataxia` %in% "No") &
            is.na(.data$`Gait ataxia severity`),
          true = 0,
          false = .data$`Gait ataxia severity`
        ),

      "Ataxia: severity*" =
        .data$`Gait ataxia severity` |>
        factor()

    )
}
