build_plot_abstract <- function(
    abstract,
    abstract_width,
    abstract_size) {
  ggplot2::ggplot() +
    ggplot2::aes(
      x = -0.9, y = 0,
      label = abstract |> stringr::str_wrap(width = abstract_width),
      hjust = 0
    ) +
    ggplot2::geom_text(size = abstract_size) +
    ggplot2::scale_x_continuous(limits = c(-1, 1)) +
    # ggplot2::scale_y_continuous(
    #   limits = c(-0.1, 0.1),
    #   expand = ggplot2::expansion(0)
    # ) +
    ggplot2::theme_void()
}
