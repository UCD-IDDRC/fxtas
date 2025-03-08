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
    dplyr::filter(.data$ml_subtype != "Type 0") |>
    ggplot() +
    aes(
      x = .data$age,
      y = .data$ml_stage

    ) +
    geom_point(
      alpha = alpha,
      if ("sex" %in% names(data)) aes(col = .data$sex)
    ) +
    geom_smooth(method = "loess", formula = y ~ x) +
    xlab("Age at visit (years)") +
    ylab("Estimated sequence stage") +
    ggplot2::theme_bw() +
    theme(legend.position = "bottom")

  n_subtypes <- data |>
    dplyr::filter(.data$ml_subtype != "Type 0") |>
    dplyr::pull("ml_subtype") |>
    dplyr::n_distinct()

  if (n_subtypes > 1) {
    graph <- graph + ggplot2::facet_wrap(~ml_subtype)
  }
  return(graph)
}
