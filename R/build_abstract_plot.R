#' Build ggplot with abstract text for cowplot
#'
#' @param abstract_text [character] String that summarizes the study's main findings.
#' @param abstract_size [numeric] Abstract text size
#' @param abstract_width [numeric] Length at which to wrap the abstract text.
#'
#' @returns a [ggplot2::ggplot]
build_abstract_plot <- function(
    abstract_text,
    abstract_size = 5,
    abstract_width = 50) {
  abstract_plot <- ggplot2::ggplot() +
    ggplot2::aes(
      x = -0.9, y = 0,
      label = abstract_text |> stringr::str_wrap(width = abstract_width),
      hjust = 0
    ) +
    ggplot2::geom_text(size = abstract_size) +
    ggplot2::scale_x_continuous(limits = c(-1, 1)) +
    ggplot2::theme_void()
  return(abstract_plot)
}
