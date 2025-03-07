categorize_MMSE <- function(
    dataset,
    levels = c(
      "Normal (26-30)",
      "Mild impairment (20-25)",
      "Moderate impairment (10-19)",
      "Severe impairment (0-9)"
    ))
{
  dataset |>
    dplyr::mutate(
      `MMSE total score*` =
        .data$`MMSE total score` |>
        case_match(
          26:30 ~ levels[1],
          20:25   ~ levels[2],
          10:19   ~ levels[3],
          0:9     ~ levels[4]
        ) |>
        factor(levels = levels)
    )
}
