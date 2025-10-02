#' @title Graphical Abstract
#' @param figs todo
#' @param tile_height todo
#' @param y_text_size todo
#' @param x_title_size todo
#' @param facet_label_prefix todo
#' @param legend.position todo
#' @param scale_colors todo
#' @param ncol_legend how many columns to use for legend
#' @param nrow_colors now many rows to use for color guide
#' @param guide_rel_widths relative widths of guides
#' @param legend_text_size [grid::unit]: legend text size
#' @param abstract [character] String that summzrizes the study's main findings.
#' @param abstract_size [numeric] Abstract text size
#' @param abstract_width [numeric] Length at which to wrap the abstract text.
#' @inheritParams cowplot::plot_grid
#' @returns a [ggplot2::ggplot]
#' @export

graphical_abstract <- function(
    figs,
    tile_height = 1,
    y_text_size = 9,
    x_title_size = 8,
    facet_label_prefix = names(figs),
    legend.position = "none", # nolint: object_name_linter
    scale_colors = c("red", "blue", "magenta", "darkgreen", "purple4"),
    rel_heights = c(1, 0.1),
    ncol_legend = 2,
    nrow_colors = 2,
    guide_rel_widths = c(.7, .3),
    legend_text_size = grid::unit(8, "pt"),
    abstract,
    abstract_size = 5,
    abstract_width = 50,
    ...
) {
  # extract and prep data from fig list
  plot_dataset <- compact_pvd_data_prep(figs = figs, ...)
  # facet labels
  facet_names <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = facet_label_prefix
  )

  # set tile width
  tile_width <- 1

  plot_dataset <-
    plot_dataset |>
    dplyr::mutate(
      facet = facet_names[as.numeric(.data$facet)] |>
        factor(levels = facet_names)
    )

  nlevels <- plot_dataset |>
    dplyr::filter(!is.na(level)) |>
    dplyr::pull("level") |>
    unique() |>
    length()


  # create level color scales
  if (length(scale_colors) != nlevels) {
    cli::cli_abort(
      c(
        "`scale_colors` must be the same length as the number of levels",
        " (number of levels = {nlevels})"
      )
    )
  }

  ## update: add colors as arguments
  level2 <- colorRampPalette(c("white", scale_colors[1])) # level 2
  level3 <- colorRampPalette(c("white", scale_colors[2])) # level 3
  level4 <- colorRampPalette(c("white", scale_colors[3])) # level 4
  level5 <- colorRampPalette(c("white", scale_colors[4])) # level 5
  level6 <- colorRampPalette(c("white", scale_colors[5])) # level 6

  level2_scale <- level2(100)
  level3_scale <- level3(100)
  level4_scale <- level4(100)
  level5_scale <- level5(100)
  level6_scale <- level6(100)

  scale_limits <- c(0, 1)

  # figure
  fig <- ggplot() +
    # layer for biomarker level 2
    ggplot2::geom_tile(
      data = plot_dataset |> dplyr::filter(.data$level == 2),
      aes(
        x = .data$position,
        y = forcats::fct_inorder(.data$biomarker_label),
        fill = .data$proportion,
        width = tile_width,
        height = tile_height
      ),
      alpha = 0.75
    ) +
    ggplot2::scale_fill_gradient(
      low = level2_scale[10],
      high = level2_scale[100],
      limits = scale_limits,
      breaks = c(0, 0.5, 1),
      guide = ggplot2::guide_colorbar(
        title = "Pr(Stage)<sub>2</sub>",
        order = 1
      )
    ) +
    # guides(fill = guide_legend(title = "Pr(Stage)<sub>2</sub>")) +
    ggnewscale::new_scale_fill() +
    # layer for biomarker level 3
    ggplot2::geom_tile(
      data = plot_dataset |>
        dplyr::filter(.data$level == 3),
      aes(
        x = .data$position,
        y = forcats::fct_inorder(.data$biomarker_label),
        fill = .data$proportion,
        width = tile_width,
        height = tile_height
      ),
      alpha = 0.75
    ) +
    ggplot2::scale_fill_gradient(
      low = level3_scale[10],
      high = level3_scale[100],
      limits = scale_limits,
      breaks = c(0, 0.5, 1),
      guide = ggplot2::guide_colorbar(
        title = "Pr(Stage)<sub>3</sub>", order = 2
      )
    ) +
    # guides(fill = guide_legend(title = "Pr(Stage)<sub>3</sub>")) +
    ggnewscale::new_scale_fill() +
    # layer for biomarker level 4
    ggplot2::geom_tile(
      data = plot_dataset |> dplyr::filter(.data$level == 4),
      aes(
        x = .data$position,
        y = forcats::fct_inorder(.data$biomarker_label),
        fill = .data$proportion,
        width = tile_width,
        height = tile_height
      ),
      alpha = 0.75
    ) +
    scale_fill_gradient(
      low = level4_scale[10],
      high = level4_scale[100],
      limits = scale_limits,
      breaks = c(0, 0.5, 1),
      guide = ggplot2::guide_colorbar(
        title = "Pr(Stage)<sub>4</sub>",
        order = 3
      )
    ) +
    # guides(fill = guide_legend(title = "Pr(Stage)<sub>4</sub>")) +
    ggnewscale::new_scale_fill() +
    # layer for biomarker level 5
    ggplot2::geom_tile(
      data = plot_dataset |> dplyr::filter(.data$level == 5),
      aes(
        x = .data$position,
        y = forcats::fct_inorder(.data$biomarker_label),
        fill = .data$proportion,
        width = tile_width,
        height = tile_height
      ),
      alpha = 0.75
    ) +
    scale_fill_gradient(
      low = level5_scale[10],
      high = level5_scale[100],
      limits = scale_limits,
      breaks = c(0, 0.5, 1),
      guide = ggplot2::guide_colorbar(
        title = "Pr(Stage)<sub>5</sub>",
        order = 4
      )
    ) +
    # guides(fill = guide_legend(title = "Pr(Stage)<sub>5</sub>")) +
    ggnewscale::new_scale_fill() +
    # layer for biomarker level 6
    ggplot2::geom_tile(
      data = plot_dataset |> dplyr::filter(.data$level == 6),
      aes(
        x = .data$position,
        y = forcats::fct_inorder(.data$biomarker_label),
        fill = .data$proportion,
        width = tile_width,
        height = tile_height
      ),
      alpha = 0.75
    ) +
    scale_fill_gradient(
      low = level6_scale[10],
      high = level6_scale[100],
      limits = scale_limits,
      breaks = c(0, 0.5, 1),
      guide = ggplot2::guide_colorbar(
        title = "Pr(Stage)<sub>6</sub>",
        order = 5
      )
    ) +
    # guides(fill = guide_legend(title = "Pr(Stage)<sub>6</sub>")) +
    # reverse order of y-axis (biomarkers)
    ggplot2::scale_y_discrete(limits = rev) +
    # frame x axis
    ggplot2::scale_x_continuous(expand = ggplot2::expansion(add = c(0.5, 2))) +
    # update axis labels
    ggplot2::labs(x = "Sequential order")

  fig <- fig +
    # wrap over facet levels
    ggplot2::facet_wrap(
      ~facet # update facet labels
    ) +
    # plot theme
    ggplot2::theme_bw() +
    ggplot2::theme(
      # add color scale info in figure caption:
      legend.text = element_text(size = legend_text_size),
      legend.title = ggtext::element_markdown(size = legend_text_size),
      legend.position = legend.position,
      # markdown for legends
      legend.byrow = TRUE,
      legend.box = "horizontal",
      # legend.justification = ,
      legend.margin = ggplot2::margin(0, 0.15, 0, -0.45, "cm"),
      axis.title.x = ggplot2::element_text(size = x_title_size),
      axis.title.y = ggplot2::element_blank(),
      axis.text.y = ggtext::element_markdown(
        size = y_text_size
      ), # allow markdown for coloring
      strip.text = ggtext::element_markdown() # allow markdown for labels
    )

  abstract_plot <- ggplot2::ggplot() +
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

  if (legend.position == "none") {
    fig <- cowplot::plot_grid(
      fig,
      cowplot::plot_grid(
        ncol = ncol_legend,
        abstract_plot,
        horizontal_greyscale_legend, # stored as internal data;
        rel_widths = guide_rel_widths,
        ...
      ),
      # see data-raw/pvd_grayscale_legend.R for details
      nrow = 2,
      rel_heights = rel_heights
    )
  }

  return(fig)
}
