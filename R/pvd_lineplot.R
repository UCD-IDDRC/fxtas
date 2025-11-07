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
#' @param x_positions positions of x-axis ticks
#' @param direction_colors a [character] vector of length 4
#' @param expand [numeric] how much to pad the sides
#' @param group_cols a named [character] [vector]
#' mapping from `biomarker_group` to a color palette
#' @param guide_group_colors [logical]:
#' whether to provide a guide for group colors
#' @param legend_text_size [grid::unit]: legend text size
#' @param nrow_group_col [integer] how many rows in group_col legend
#' @inheritParams cowplot::plot_grid
#' @export
#' @example inst/examples/exm-pvd_lineplot.R
pvd_lineplot <- function(
    figs,
    events_to_highlight = NULL,
    highlight_color = "yellow",
    min_alpha = 0.5,
    max_alpha = 1,
    stage_alpha = 1,
    facet_labels = names(figs),
    text_size = 3.4,
    y_lab = "Sequential order",
    y_title_size = 9,
    y_text_size = 8,
    x_text_size = grid::unit(8, "points"),
    nrow_group_col = 1,
    x_positions = c(1.01, 1.14),
    direction_colors = c(
      "(stage)" = "grey25",
      # "#F8766D",
      "down" = "#DC3220",
      "neutral" = "grey70",
      # "#00BFC4"
      "up" = "#005AB5"
    ),
    expand = 0,
    group_cols = group_colors(figs),
    rel_heights = c(6, 1),
    legend_text_size = grid::unit(8, "pt"),
    guide_group_colors = TRUE) {

  dataset <- extract_lineplot_data(figs, facet_labels)

  # additional processing
  plot_dataset <- dataset |>
    pvd_lineplot_preprocessing(
      facet_labels,
      events_to_highlight,
      highlight_color,
      x_positions = x_positions
    )

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

  facet_names <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = facet_labels
  )

  facet_x_labels <- c(
    glue::glue('<p "style = text-align: right">{facet_names[1]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_names[2]}</p>')
  )

  # plot
  to_return <- plot_dataset |>
    ggplot() +
    aes(
      x = .data$facet_order,
      y = .data$Order |> factor()
    ) +
    ggtext::geom_richtext(
      aes(
        label = .data$`event label`,
        hjust = .data$hjust,
        fill = .data$background,
        color = .data$biomarker_group
      ),
      label.color = NA,
      label.padding = grid::unit(rep(1, 4), "pt"),
      size = text_size
    ) +
    scale_fill_identity() +
    ggplot2::scale_color_manual(
      guide = ggh4x::guide_stringlegend(
        order = 3,
        nrow = nrow_group_col
      ),
      name = "Symptom category:",
      values = group_cols
    ) +
    ggplot2::scale_linewidth_identity(guide = "none") +
    ggplot2::scale_alpha_continuous(
      guide = ggplot2::guide_legend(order = 1),
      name = "Distance:",
      range = c(min_alpha, max_alpha)
    ) +
    scale_x_continuous(
      expand = ggplot2::expansion(add = expand),
      limits = c(0.65, 1.5),
      breaks = x_positions,
      labels = facet_x_labels
    ) +
    scale_y_discrete(
      name = y_lab,
      limits = rev,
      breaks = NULL
    ) +
    theme_classic() +
    ggnewscale::new_scale_color() +
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
    scale_color_manual(
      guide = ggplot2::guide_legend(
        theme = theme(legend.title = element_text(size = x_text_size)),
        order = 2,
        ncol = 2
      ),
      name = "Direction:",
      drop = FALSE,
      values = direction_colors
    ) +
    theme(
      legend.position = "bottom",
      legend.box = "vertical",
      legend.text = element_text(size = legend_text_size),
      legend.title = element_text(size = legend_text_size),
      axis.title.x = ggplot2::element_blank(),
      axis.line.y = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(
        size = x_text_size,
        hjust = plot_dataset[["hjust"]] |> unique()
      )
    )

  if (!guide_group_colors) {
    return(to_return + guides(col = "none"))
  } else {
    legends <- to_return |> cowplot::get_legend()
    plot <- to_return + theme(legend.position = "none")

    cowplot::ggdraw(
      cowplot::plot_grid(
        ncol = 1,
        cowplot::plot_grid(plot),
        cowplot::plot_grid(
          nrow = 2,
          cowplot::plot_grid(legends[3], legends[5], ncol = 2),
          cowplot::plot_grid(legends[7])
        ),
        rel_heights  = rel_heights
      )
    )
  }
}
