#' Make demographics table
#'
#' @param data a [data.frame] containing the variables specified by
#' `strata` and `vars`
#' @param strata names of column variable, specified as [character]
#' @param vars names of row variables, specified as [character]
#' @param make_ft [logical] whether to convert to flextable
#' @inheritDotParams format_demographics_table_as_flextable -x
#' @inherit format_demographics_table_as_flextable return
#' @export
#'
#' @examples
#' test_data_v1 |> make_demographics_table()
make_demographics_table <- function(
    data,
    strata = "Gender",
    vars = c(
      # "Study",
      "Age at visit",
      # "# visits",
      # column_var,
      "Primary Race/Ethnicity",
      # "Primary Ethnicity",
      # "Primary Race",
      "FXTAS Stage",
      "CGG"
      # "Activation Ratio (0.0-1.0)"
      # "ApoE")
    ),
    make_ft = TRUE,
    ...) {


  data_to_use <- data |>
    dplyr::select(all_of(vars), "Gender", "FX*")
  # create table using gtsummary with p-value for sex difference



  tbl_stat <-
    gtsummary::tbl_strata(
      data = data_to_use,
      strata = all_of(strata),
      .tbl_fun = ~ .x |> table_function()
    )

  tbl_pval <- data |>
    dplyr::select(all_of(c(vars, "Gender"))) |>
    gtsummary::tbl_summary(by = "Gender", missing_text = "Missing") |>
    gtsummary::add_p(
      pvalue_fun = \(x) gtsummary::style_number(x, digits = 3)
    ) |>
    gtsummary::modify_column_hide(columns = c("stat_1", "stat_2")) |>
    gtsummary::separate_p_footnotes(
      footnote_prefix = "p-value for significance of sex difference by"
    )

  to_return <- list(tbl_stat, tbl_pval) |>
    gtsummary::tbl_merge(tab_spanner = FALSE) |>
    gtsummary::bold_labels() |>
    gtsummary::modify_footnote(
      "p.value_2" = paste(
        "p-values represent tests for sex differences in",
        "distributions of characteristics, all CGG repeat levels."
      )
    )

  if (make_ft) {
    to_return <-
      to_return |>
      format_demographics_table_as_flextable(...)
  }

  return(to_return)

}

table_function <- function(data) {
  data |>
    gtsummary::tbl_summary(
      by = "FX*",
      type = gtsummary::all_continuous() ~ "continuous2",
      statistic = list(
        gtsummary::all_continuous() ~
          c("{mean} ({sd})", "{median} [{min}, {max}]")
      ),
      # round mean to 1 digit, SD to 2 digits, Median and Range to 0
      digits = list(
        `Age at visit` ~ c(1, 2, 0, 0, 0),
        CGG ~ c(1, 2, 0, 0, 0)
      ),
      missing_stat = "{N_miss} ({p_miss}%)",
      missing_text = "Missing"
    )
}
