fix_demographics <- function(dataset)
{
  dataset |>
    dplyr::mutate(

      `Birth Date` =
        (.data$`Visit Date` - days(round(.data$`Age at visit` * 365.25))) |>
        lubridate::date(), # causes problems for eg 	100399-100


    ) |>

    group_by(across(all_of("FXS ID"))) |>

    tidyr::fill(
      all_of(
        c(
          "Primary Race",
          "Primary Ethnicity",
          "Gender"
        )
      ),
      .direction = "downup") |>
    dplyr::mutate(
      `Recruited in study phase` = first(.data$Study)
    ) |>
    ungroup()
}
