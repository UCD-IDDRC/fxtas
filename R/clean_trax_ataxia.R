clean_trax_ataxia <- function(data)
{
  data |>
    dplyr::mutate(

      `Ataxia severity: missingness reasons` =
        .data$`gait ataxia severity exam` |> missingness_reasons.numeric(),

      # setting missing codes as 0s:
      `gait ataxia severity exam` =
        dplyr::case_when(
          .data$`gait ataxia severity exam` %in% c("888","999") ~ 0,
          TRUE ~ .data$`gait ataxia severity exam`
        ),

      `gait ataxia severity exam` =
        .data$`gait ataxia severity exam` |>
        clean_numeric(),

      `gait ataxia exam` =
        if_else(
          condition =
            (.data$`gait ataxia severity exam` %in% 0) & is.na(.data$`gait ataxia exam`),
          true = "No",
          false = .data$`gait ataxia exam`
        ) |>
        factor(levels = c("No", "Yes")),

      `gait ataxia severity exam` =
        if_else(
        condition =
          (.data$`gait ataxia exam` %in% "No") & is.na(.data$`gait ataxia severity exam`),
        true = 0,
        false = .data$`gait ataxia severity exam`
      ),

      `gait ataxia severity*` =
        case_when(
          .data$`gait ataxia severity exam` == "2.5" ~ 2,
          TRUE ~ .data$`gait ataxia severity exam`
        ) |>
        factor()

    )
}
