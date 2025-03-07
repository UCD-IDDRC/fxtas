#' plot compact pvd: figure
#' @examples
#' size.y <- 11
#' figs <- extract_figs_from_pickle(
#'   size.y = size.y,
#'   n_s = 3,
#'   rda_filename = "data.RData",
#'   dataset_name = "sample_data",
#'   output_folder = fs::path_package("extdata/sim_data", package = "fxtas")
#' )
#'
#' y_text_size <- 11
#' tile_height <- 1
#' # facet_label_size = 8
#' facet_label_prefix <- names(figs)
#' legend.position <- "none"
#' scale_colors <- c("red", "blue", "purple4")
#' plot_dataset <- fxtas:::compact_pvd_data_prep(figs = figs)
#' # facet labels
#' facet_names <- fxtas:::compact_pvd_facet_labels(
#'   figs = figs,
#'   facet_label_prefix = facet_label_prefix
#' )
#' # generate figure
#' fxtas:::compact_pvd_figure(
#'   plot_dataset,
#'   tile_height = tile_height,
#'   y_text_size = y_text_size,
#'   facet_names = facet_names,
#'   # facet_label_size = facet_label_size,
#'   legend.position = legend.position,
#'   scale_colors = scale_colors
#' )
#' @dev
compact_pvd_figure <- function(
    plot_dataset,
    tile_height,
    y_text_size,
    facet_names,
    # facet_label_size,
    legend.position, # nolint: object_name_linter
    scale_colors,
    rel_heights = c(1, 0.1),
    ...) {
  # set tile width
  tile_width <- 1

  plot_dataset <-
    plot_dataset |>
    dplyr::mutate(
      facet = facet_names[as.numeric(.data$facet)] |>
        factor(levels = facet_names)
    )

  nlevels <- plot_dataset |>
    dplyr::pull("level") |>
    unique() |>
    length()

  # create level color scales
  if (length(scale_colors) != nlevels) {
    stop(
      "`scale_colors` must be the same length as the number of levels",
      " (number of levels = ", nlevels, ")"
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
      legend.position = legend.position,
      legend.title = ggtext::element_markdown(), # markdown for legends
      legend.byrow = TRUE,
      legend.box = "horizontal",
      # legend.justification = ,
      legend.margin = ggplot2::margin(0, 0.15, 0, -0.45, "cm"),
      axis.title.y = ggplot2::element_blank(),
      axis.text.y = ggtext::element_markdown(
        size = y_text_size
      ), # allow markdown for coloring
      strip.text = ggtext::element_markdown() # allow markdown for labels
    )

  if (legend.position == "none") {
    fig <- cowplot::plot_grid(
      fig, horizontal_greyscale_legend,
      nrow = 2,
      rel_heights = rel_heights
    )
  }

  return(fig)
}
