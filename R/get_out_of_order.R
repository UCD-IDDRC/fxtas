get_out_of_order <- function(dataset)
{
  dataset |>
    dplyr::select(
      all_of(
        c(
          "FXS ID",
          "Visit Date",
          "Event Name")
      )
    ) |>
    dplyr::filter(
      .by = "FXS ID",
      is.unsorted(`Event Name`)
    ) |>
    # dplyr::filter(.by = "FXS ID", any(`decreased age`, na.rm = TRUE)) |>
    # ungroup() |>
    group_split(across(all_of("FXS ID")))
}
