#' graph stage by age
#'
#' @param data todo
#' @param alpha todo
#'
#' @returns a [ggplot2::ggplot]
#' @export
graph_stage_by_age <- function(data,
                               alpha = .7) {
  graph <- data |>
    dplyr::filter(.data$ml_subtype != "Subtype 0") |>
    mutate(
      .by = "ml_subtype",
      ml_subtype = paste0(.data$ml_subtype, ": N = ", n())
    ) |>
    ggplot() +
    aes(
      x = .data$age,
      y = .data$ml_stage

    ) +
    geom_point(
      alpha = alpha,
      if ("sex" %in% names(data)) aes(col = .data$sex, shape = .data$sex)
    ) +
    geom_smooth(
      aes(linetype = "LOESS"),
      method = "loess",
      formula = y ~ x
    ) +
    labs(
      x = "Age at visit (years)",
      y = "Estimated sequence stage",
      linetype = "",
      shape = "",
      col = ""
    ) +
    ggplot2::theme_bw() +
    theme(legend.position = "bottom")

  n_subtypes <- data |>
    dplyr::filter(.data$ml_subtype != "Subtype 0") |>
    dplyr::pull("ml_subtype") |>
    dplyr::n_distinct()

  if (n_subtypes > 1) {
    graph <- graph + ggplot2::facet_wrap(~ml_subtype)
  }
  return(graph)
}
