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
    ) |>
    # more recent assays may be more accurate:
    dplyr::mutate(
      .by = all_of(c("FXS ID")),
      `ApoE` = .data$`ApoE` |> dplyr::last(na_rm = TRUE)
    )


}
