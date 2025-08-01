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
#' @param direction_colors a [character] vector of length 4
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
    direction_colors = c(
      "grey25",
      # "#F8766D",
      "#DC3220",
      "grey70",
      # "#00BFC4"
      "#005AB5"
    ),
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
      abs_change = abs(.data$Change),
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (.data$abs_change * alpha_mult) + min_alpha
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
      data = plot_dataset |> filter(.data$biomarker != "FXTAS Stage"),
      aes(
        group = .data$`event name`,
        color = .data$Change_color,
        alpha = .data$abs_change,
        linewidth = .data$linesize
      )

    ) +
    geom_line(
      data = plot_dataset |> filter(.data$biomarker == "FXTAS Stage"),
      aes(
        group = .data$`event name`,
        color = .data$Change_color,
        linewidth = .data$linesize
      ),
      alpha = stage_alpha,


    ) +
    ggplot2::scale_linewidth_identity(guide = "none") +
    ggplot2::scale_alpha_continuous(
      name = "Distance",
      range = c(min_alpha, max_alpha)
    ) +
    scale_x_continuous(
      expand = ggplot2::expansion(add = c(expand)),
      limits = c(0.65, 1.5),
      breaks = c(1, 1.15),
      labels = facet_x_labels
    ) +
    scale_color_manual(
      name = "Direction",
      drop = FALSE,
      values = direction_colors
    ) +
    scale_y_discrete(
      name = y_lab,
      limits = rev,
      breaks = NULL) +
    theme_classic() +
    theme(
      legend.position = "bottom",
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(
        size = x_text_size,
        hjust = plot_dataset[["hjust"]]
      )
    )
}
