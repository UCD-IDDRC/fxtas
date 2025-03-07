clean_trax_ataxia <- function(data)
{
  data |>
    dplyr::mutate(

      `Ataxia severity: missingness reasons` =
        .data$`Ataxia: severity` |> missingness_reasons.numeric(),

      # setting missing codes as 0s:
      `Ataxia: severity` =
        dplyr::case_when(
          .data$`Ataxia: severity` %in% c("888","999") ~ 0,
          TRUE ~ .data$`Ataxia: severity`
        ),

      `Ataxia: severity` =
        .data$`Ataxia: severity` |>
        clean_numeric(),

      `Ataxia` =
        if_else(
          condition =
            (.data$`Ataxia: severity` %in% 0) & is.na(.data$Ataxia),
          true = "No",
          false = .data$`Ataxia`
        ) |>
        factor(levels = c("No", "Yes")),

      `Ataxia: severity` =
        if_else(
        condition =
          (.data$Ataxia %in% "No") & is.na(.data$`Ataxia: severity`),
        true = 0,
        false = .data$`Ataxia: severity`
      ),

      `Ataxia: severity*` =
        case_when(
          .data$`Ataxia: severity` == "2.5" ~ 2,
          TRUE ~ .data$`Ataxia: severity`
        ) |>
        factor()

    )
}
