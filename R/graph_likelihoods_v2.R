#' Title
#'
#' @param likelihoods todo
#' @param alpha todo
#' @param facet whether to facet by number of subtypes
#' @param legend whether to show legend
#'
#' @returns a [ggplot2::ggplot]
#' @export
#' @examples
#' example_likelihoods |> graph_likelihoods_v2(alpha = 0.5)
#'
graph_likelihoods_v2 <- function(
    likelihoods,
    alpha = 0.5,
    facet = FALSE,
    legend = FALSE)
{

  data <-
    likelihoods |>
    format_likelihoods()

  xmax <- max(data$Iteration) * 1.2

  labels <- data |>
    slice_tail(n = 1, by = "name") |>
    mutate(Iteration = Iteration * 1.05)

  plot1 <-
    data |>
    ggplot() +
    aes(
      x = .data$Iteration,
      y = .data$value,
      col = .data$n_subtypes
    ) +
    geom_line(alpha = alpha) +
    ggplot2::geom_text(
      data = labels,
      aes(
        hjust = 'outward',
        vjust = 0,

        # x = 10000,
        # y = labels$value,
        label = .data$name)
    ) +
    ylab("log-likelihood") +
    ggplot2::scale_x_continuous(
      limits = c(0, xmax),
      breaks = seq(0, max(data$Iteration), length.out = 5)) +
    theme_bw()

  if (legend) {
    plot1 <- plot1 +
      theme(legend.position = "bottom") +
      labs(color = "# latent subtypes")
  } else
  {
    plot1 <- plot1 +
      theme(legend.position = "none")
  }
  if (facet) {
    plot1 <- plot1 + facet_wrap(~name)
  }

  return(plot1)
}
