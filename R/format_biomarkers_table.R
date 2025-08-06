#' Print method for `biomarkers_table`
#'
#' @param x a "biomarkers_table" object from `make_biomarkers_table()`
#' @param width_biomarkers [numeric]: width for `Symptom` column
#' @param width_levels [numeric]: width for "Defined Ordered Levels" column
#' @param use_group_colors [logical] whether to use text colors to represent categories
#' @returns a [flextable::flextable()]
#' @export
#'
flex_biomarkers_table <- function(
    x,
    width_biomarkers = 1.5,
    width_levels = 1.45,
    use_group_colors = TRUE) {
  to_return <- x |>
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
        "p-value",
        "group_color"
      )
    )

  if (use_group_colors) {
    to_return <- to_return |>
      flextable::color(j = 1:2, color = x$group_color)
  }

  to_return |>
    flextable::width(j = ~ biomarker, width = width_biomarkers) |>
    flextable::width(j = ~ category, width = 0.8) |>
    flextable::width(j = ~ levels, width = width_levels) |>
    flextable::width(j = ~ Female, width = .6) |>
    flextable::width(j = ~ Male, width = .6) |>
    flextable::width(j = ~ `p-value`, width = .6) |>
    flextable::theme_booktabs() |>
    flextable::align(
      j = ~ biomarker + levels,
      align = "center",
      part = "all"
    ) |>
    flextable::delete_columns(j = 7) |>
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
