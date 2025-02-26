clean_ataxia <- function(data) {
  data |>
    dplyr::mutate(

      "Ataxia severity: missingness reasons" =
        missingness_reasons.numeric(.data$`Ataxia: severity`),

      # setting missing codes as 0s:
      "Ataxia: severity" =
        dplyr::if_else(
          condition = .data$`Ataxia: severity` %in% c(888, 999),
          true = "0",
          false = .data$`Ataxia: severity`
        ),

      "Ataxia: severity" =
        .data$`Ataxia: severity` |>
        clean_numeric(),

      Ataxia =
        if_else(
          condition = (.data$`Ataxia: severity` %in% 0) &
            is.na(.data$Ataxia),
          true = "No",
          false = .data$`Ataxia`
        ) |>
        factor(levels = c("No", "Yes")),

      "Ataxia: severity" =
        if_else(
          condition = (.data$Ataxia %in% "No") &
            is.na(.data$`Ataxia: severity`),
          true = 0,
          false = .data$`Ataxia: severity`
        ),

      "Ataxia: severity*" =
        .data$`Ataxia: severity` |>
        factor()

    )
}
