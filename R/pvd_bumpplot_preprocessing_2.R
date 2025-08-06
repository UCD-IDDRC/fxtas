pvd_bumpplot_preprocessing_2 <- function(
    plot_dataset,
    min_alpha,
    max_alpha,
    stage_alpha) {
  # alpha scaling #
  alpha_mult <- calc_alpha_mult(plot_dataset, max_alpha, min_alpha)

  tmp_labels <- gsub("<i.+'>", "", plot_dataset$`event label`) |>
    gsub(pattern = "</i>", replacement = "", x = _) |>
    gsub(pattern = "<b>", replacement = "", x = _) |>
    gsub(pattern = "</b>", replacement = "", x = _)

  max_event_length <- tmp_labels |>
    nchar() |>
    max()

  even_length <- ceiling(max_event_length / 2) * 2

  plot_dataset <- plot_dataset |>
    dplyr::mutate(
      # NEED TO FIX
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (0.5 * alpha_mult) + min_alpha
      ),
      # force string to be same length?
      padded_event = stringr::str_pad(
        tmp_labels,
        width = even_length,
        side = "both"
      ) |> factor()
    ) |>
    dplyr::mutate(
      # apply to label?
      padded_label = mapply( # nolint: undesirable_function_linter
        gsub,
        pattern = tmp_labels,
        replacement = .data$padded_event,
        x = .data$`event label`
      )

    )
}
