### create race/ethnicity variable ###
create_race_ethnicity <- function(dataset){
  # dataset |>
  #   dplyr::mutate(
  #     tmp.race = forcats::fct_recode(
  #       `Primary Race`,
  #       # incorporate Asian into Other
  #       Other = "Asian"
  #     ),
  #     tmp.ethnicity
  #   ) |>
  #   tidyr::unite(
  #     col = `Primary Race/Ethnicity`,
  #     tmp.ethnicity, tmp.race,
  #     sep = ", ",
  #     remove = TRUE,
  #     na.rm = TRUE
  #   )
  dataset |>
    dplyr::mutate(
      `Primary Race/Ethnicity` =
        case_when(
          .data$`Primary Ethnicity` == "Hispanic or Latino" ~ "Hispanic",
          # (is.na(`Primary Race`) & is.na(`Primary Ethnicity`)) ~ NA_character_,
          .default = .data$`Primary Race`
        ) |>
        factor(
          levels = c("White", "Hispanic", "Black", "Other")
        )
    )
}

order_by_frequency <- function(x)
{
  levels = x |>
    table() |>
    unlist() |>
    sort(decreasing = TRUE) |>
    names()

  x |> factor(levels = levels)

}
