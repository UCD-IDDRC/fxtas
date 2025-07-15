#' Print method for `biomarkers_table`
#'
#' @param x a "biomarkers_table" object from `make_biomarkers_table()`
#'
#' @returns a [flextable::flextable()]
#' @export
#'
flex_biomarkers_table <- function(x) {
  x |>
    dplyr::mutate(
      biomarker = .data$biomarker |> Hmisc::capitalize(),
      "p-value" = .data$`p-value` |> scales::label_pvalue()()
    ) |>
    flextable::flextable() |>
    flextable::set_header_labels(
      values = c(
        "Category",
        "Symptom",
        "Defined Ordered Levels",
        "Female",
        "Male",
        "p-value"
      )
    ) |>
    flextable::width(j = ~ biomarker, width = 1.3) |>
    flextable::width(j = ~ category, width = 0.8) |>
    flextable::width(j = ~ levels, width = 1.4) |>
    flextable::width(j = ~ Female, width = .6) |>
    flextable::width(j = ~ Male, width = .6) |>
    flextable::width(j = ~ `p-value`, width = .6) |>
    flextable::theme_booktabs() |>
    flextable::align(
      j = ~ biomarker + levels,
      align = "center",
      part = "all"
    ) |>
    flextable::footnote(
      i = 1,
      j = 4:5,
      value = "% of participants with clinically elevated levels" |>
        flextable::as_paragraph(),
      ref_symbols = "a",
      part = "header"
    ) |>
    flextable::footnote(
      i = 1,
      j = 6,
      value = "p-value for significance of sex difference by Fisher's exact test" |> # nolint: line_length-linter
        flextable::as_paragraph(),
      ref_symbols = "b",
      part = "header"
    ) |>
    shared_flextable_settings(padding = 1)

}
