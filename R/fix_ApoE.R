fix_ApoE <- function(dataset) { # nolint: object_name_linter

  dataset |>
    dplyr::mutate(
      ApoE =
        .data$ApoE |>
        as.character() |>
        strsplit(", ") |>
        sapply(sort) |>
        sapply(paste, collapse = ", ") |>
        na_if(""),

      ApoE =
        .data$ApoE |>
        factor(levels = sort(unique(.data$ApoE))),

      `ApoE (original)` = .data$ApoE,
    ) |>
    dplyr::relocate(
      "ApoE (original)", .after = "ApoE"
    )

  ApoE <- dataset |>
    dplyr::mutate(
      .by = `FXS ID`,
      `ApoE` = `ApoE` |> dplyr::last(na_rm = TRUE) # more recent assays may be more accurate
    )


}
