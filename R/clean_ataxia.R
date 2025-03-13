clean_ataxia <- function(data) {
  to_return <-
    data |>
    dplyr::mutate(

      across(
        any_of(c("ataxia exam", "ataxia hx")),
        replace_missing_codes
      ),

      "ataxia severity exam: missingness reasons" =
        .data$`ataxia severity exam` |>
        missingness_reasons.numeric(),

      # setting missing codes as 0s:

      across(
        any_of(
          c(
            "ataxia severity exam",
            "ataxia severity hx"
          )
        ),
        \(x) x |> replace_missing_with_0() |> clean_numeric()

      )

    ) |>
    combine_presence_and_severity(
      binary_varname = "ataxia hx",
      severity_varname = "ataxia severity hx") |>
    combine_presence_and_severity(
      binary_varname = "ataxia exam",
      severity_varname = "ataxia severity exam") |>
    combine_history_and_exam("ataxia severity")

  to_return <-
    to_return |>
    combine_history_and_exam("ataxia") |>
    mutate(
      "ataxia severity*" =
        .data$`ataxia severity` |>
        factor()

    )
}
