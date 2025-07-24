#' Plot change in Stage ranking
#'
#' @param figs a [list] of todo
#' @param facet_labels todo
#' @param events_to_highlight todo
#' @param highlight_color todo
#' @param y_title_size todo
#' @param text_size todo
#' @param y_text_size todo
#' @param x_text_size todo
#' @param min_alpha todo
#' @param max_alpha todo
#' @param stage_alpha todo
#' @param y_lab todo
#' @param expand [numeric] how much to pad the sides
#'
#' @export
#' @example inst/examples/exm-pvd_lineplot.R
pvd_lineplot <- function(
    figs,
    events_to_highlight = NULL,
    highlight_color = NA,
    min_alpha = 0.25,
    max_alpha = 1,
    stage_alpha = 1,
    facet_labels = names(figs),
    text_size = 3.4,
    y_lab = "Sequential order",
    y_title_size = 9,
    y_text_size = 8,
    x_text_size = 8,
    expand = 0.25) {

  dataset <- extract_lineplot_data(figs, facet_labels)

  # additional processing
  plot_dataset <- dataset |>
    pvd_lineplot_preprocessing(
    facet_labels,
    events_to_highlight,
    highlight_color)

  # alpha scaling #
  alpha_mult <- calc_alpha_mult(plot_dataset, max_alpha, min_alpha)

  plot_dataset <- plot_dataset |>
    dplyr::mutate(
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (abs(.data$Change) * alpha_mult) + min_alpha
      )
    )

  facet_x_labels <- c(
    glue::glue('<p "style = text-align: right">{facet_labels[1]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_labels[2]}</p>')
  )

  # plot
  plot_dataset |>
    ggplot() +
    aes(
      x = .data$facet_order,
      y = .data$Order |> factor()
    ) +
    ggtext::geom_richtext(
      aes(
        label = .data$`event label`,
        hjust = .data$hjust,
        fill = .data$background
      ),
      label.color = NA,
      label.padding = grid::unit(rep(1, 4), "pt"),
      size = text_size
    ) +
    scale_fill_identity() +
    geom_line(
      aes(
        group = .data$`event name`,
        color = .data$Change_color
      ),
      linewidth = plot_dataset$linesize,
      alpha = plot_dataset$alpha
    ) +
    scale_x_continuous(
      expand = ggplot2::expansion(add = c(expand)),
      limits = c(0.65, 1.5),
      breaks = c(1, 1.15),
      labels = facet_x_labels
    ) +
    scale_color_manual(
      drop = FALSE,
      values = c(
        "grey25",
        "#F8766D",
        "grey70",
        "#00BFC4"
      )
    ) +
    scale_y_discrete(limits = rev, breaks = NULL) +
    labs(y = y_lab) +
    theme_classic() +
    theme(
      legend.position = "none",
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(
        size = x_text_size,
        hjust = plot_dataset[["hjust"]]
      )
    )
}
