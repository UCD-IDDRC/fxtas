#' Plot compact PVD
#' tmp function using list of extract_figs_from_pickle
#' @inheritDotParams compact_pvd_data_prep
#' @param figs todo
#' @param tile_height todo
#' @param y_text_size todo
#' @param facet_label_prefix todo
#' @param legend.position todo
#' @param scale_colors todo
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
    ...) {
  # extract and prep data from fig list
  plot_dataset <- compact_pvd_data_prep(figs = figs, ...)
  # facet labels
  facet_names <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = facet_label_prefix
  )
  # generate figure
  compact_pvd_figure(
    plot_dataset,
    tile_height = tile_height,
    y_text_size = y_text_size,
    facet_names = facet_names,
    legend.position = legend.position,
    scale_colors = scale_colors
  )
}
