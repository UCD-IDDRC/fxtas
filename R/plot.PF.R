#' Create positional variance diagram (PVD)
#'
#' @param object a "PF" object (created by `compute_position_frequencies()`)
#' @param size.y size of biomarker event labels
#' @param color_label label for legend color scale
#' @param ... not currently used
#' @return a "PVD" object (extends [ggplot2::ggplot()])
#' @export
#'
autoplot.PF <- function(
    object,
    size.y = 10,
    color_label = "Pr(stage)",
    ...) {
  to_return <-
    object |>
    dplyr::mutate(
      position = as.numeric(.data$position)
    ) |>
    ggplot(
      aes(
        x = .data$position,
        y = .data$`event label`,
        fill = .data$proportion
      )
    ) +
    ggplot2::geom_tile() +
    # scale_fill_identity() +
    ggplot2::scale_fill_gradient(
      low = "gray",
      high = "red"
    ) +
    ggplot2::scale_y_discrete(limits = rev) +
    ggplot2::xlab("Sequential order") +
    ggplot2::ylab(NULL) +
    ggplot2::theme_bw() +
    ggplot2::theme(
      legend.position = "bottom",
      axis.text.y =
        ggtext::element_markdown(
          hjust = 0,
          size = size.y
        )
    ) +
    ggplot2::labs(fill = color_label)

  to_return |>
    structure(class = c("PVD", class(to_return)))
}
