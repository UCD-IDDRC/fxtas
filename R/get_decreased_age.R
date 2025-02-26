get_decreased_age <- function(dataset) {
  dataset |>

    arrange(
      across(
        all_of(
          c("FXS ID", "Event Name")
        )
      )
    ) |>
    # not sure about this one;
    # added later to clarify difference from below
    # where we arrange by visit date instead of event name

    dplyr::mutate(
      .by = "FXS ID",
      `diff age` = c(NA, base::diff(.data$`Age at visit`)),
      `decreased age` = .data$`diff age` < 0
    ) |>
    dplyr::filter(
      any(.data$`decreased age`, na.rm = TRUE)
    ) |>
    dplyr::select(
      all_of(
        c(
          "FXS ID",
          "Event Name",
          "Visit Date",
          "Age at visit",
          "diff age",
          "decreased age"
        )
      )
    )
}

get_decreased_age2 <- function(dataset) {
  dataset |>
    arrange(
      across(
        all_of(
          c("FXS ID", "Visit Date")
        )
      )
    ) |>
    dplyr::mutate(
      .by = "FXS ID",
      `diff age` = c(NA, base::diff(.data$`Age at visit`)),
      `decreased age` = .data$`diff age` < 0
    ) |>
    dplyr::filter(
      any(.data$`decreased age`, na.rm = TRUE)
    ) |>
    dplyr::select(
      all_of(
        c(
          "FXS ID",
          "Event Name",
          "Visit Date",
          "Age at visit",
          "diff age",
          "decreased age"
        )
      )
    )
}
