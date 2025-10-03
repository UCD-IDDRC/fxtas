#' Plot compact PVD
#' tmp function using list of extract_figs_from_pickle
#' @inheritDotParams compact_pvd_data_prep
#' @param figs todo
#' @param tile_height todo
#' @param y_text_size todo
#' @param facet_label_prefix todo
#' @param legend.position todo
#' @param scale_colors todo
#' @param ncol_legend how many columns to use for legend
#' @param nrow_colors now many rows to use for color guide
#' @param guide_rel_widths relative widths of guides
#' @param legend_text_size [grid::unit]: legend text size
#' @param show_group_color_legend [logical]: whether to show group col legend
#' @param show_grayscale_legend [logical] whether to show grayscale legend
#' @inheritParams cowplot::plot_grid
#' @export
#' @returns a [ggplot2::ggplot]
#' @example inst/examples/exm-plot_compact_pvd.R
plot_compact_pvd <- function(
    figs,
    tile_height = 1,
    y_text_size = 9,
    facet_label_prefix = names(figs),
    legend.position = "none", # nolint: object_name_linter
    scale_colors = c("red", "blue", "magenta", "darkgreen", "purple4"),
    rel_heights = c(1, 0.1),
    ncol_legend = 2,
    nrow_colors = 2,
    guide_rel_widths = c(.7, .3),
    legend_text_size = grid::unit(8, "pt"),
    show_group_color_legend = TRUE,
    show_grayscale_legend = (legend.position == "none"),
    ...) {
  # extract and prep data from fig list
  plot_dataset <- compact_pvd_data_prep(figs = figs, ...)
  # facet labels
  facet_names <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = facet_label_prefix
  )

  group_colors <- figs |> group_colors()

  if (show_group_color_legend && length(figs) > 1) {
    group_color_legend <- plot_dataset |>
      pvd_scatter(
        nrow_colors = nrow_colors,
        group_colors = group_colors,
        legend_text_size = legend_text_size
      ) |>
      cowplot::get_legend()
  } else {
    group_color_legend <- NULL
  }
  # generate figure
  compact_pvd_figure(
    plot_dataset,
    tile_height = tile_height,
    y_text_size = y_text_size,
    facet_names = facet_names,
    legend.position = legend.position,
    scale_colors = scale_colors,
    group_colors = group_colors,
    rel_heights = rel_heights,
    group_color_legend = group_color_legend,
    show_grayscale_legend = show_grayscale_legend,
    ncol_legend = ncol_legend,
    guide_rel_widths = guide_rel_widths,
    legend_text_size = legend_text_size
  )
}
