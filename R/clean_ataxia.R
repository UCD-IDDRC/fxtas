clean_ataxia <- function(data) {
  to_return <-
    data |>
    dplyr::mutate(

      "gait ataxia severity exam: missingness reasons" =
        .data$`gait ataxia severity exam` |>
        missingness_reasons.numeric(),

      # setting missing codes as 0s:
      "gait ataxia severity exam" =
        .data$`gait ataxia severity exam` |>
        replace_missing_with_0() |>
        clean_numeric(),

      "gait ataxia severity hx" =
        .data$`gait ataxia severity hx` |>
        replace_missing_with_0() |>
        clean_numeric()
      ) |>
    combine_presence_and_severity(
      binary_varname = "gait ataxia hx",
      severity_varname = "gait ataxia severity hx") |>
    combine_presence_and_severity(
      binary_varname = "gait ataxia exam",
      severity_varname = "gait ataxia severity exam") |>
    combine_history_and_exam("gait ataxia severity")

  to_return <-
    to_return |>
    combine_history_and_exam("gait ataxia") |>
    mutate(
      "gait ataxia severity*" =
        .data$`gait ataxia severity` |>
        factor()

    )
}
