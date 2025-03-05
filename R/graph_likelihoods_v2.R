#' Title
#'
#' @param likelihoods todo
#' @param alpha todo
#'
#' @returns a [ggplot2::ggplot]
#' @export
#' @examples
#' example_likelihoods |> graph_likelihoods_v2(alpha = 0.5)
#'
graph_likelihoods_v2 <- function(
    likelihoods,
    alpha = 0.5)
{

  data <-
    likelihoods |>
    format_likelihoods()

  xmax <- max(data$Iteration) * 1.1

  labels = data |>
    slice_tail(n = 1, by = "name")

  data |>
    ggplot() +
    aes(
      x = .data$Iteration,
      y = .data$value,
      col = .data$name
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
    # facet_wrap(~name) +
    ylab("log-likelihood") +
    ggplot2::xlim(c(0, xmax)) +
    theme_bw() +
    theme(legend.position = "none")
}
