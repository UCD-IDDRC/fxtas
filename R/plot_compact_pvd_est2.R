#' @title Plot SuStaIn Sequential Estimate
#' @inheritParams plot_compact_pvd_est
#' @param show_uncert Show the uncertainty in the sequential order. Logical.
#' @param tile_width todo
#' @param rel_heights relative heights of the plot and the legend
#' @param facet_labels facet labels
#' @param vjust vjust for cowplot labels
#' @param ... arguments passed to `tmp_func()`
#' @export
#' @example inst/examples/exm-plot_compact_pvd_est2.R
#'
plot_compact_pvd_est2 <- function(
    figs,
    show_uncert = TRUE,
    tile_height = 1,
    tile_width = 1,
    y_text_size = 9,
    legend.position = "none", # nolint: object_name_linter
    scale_colors = c("red", "blue", "magenta", "darkgreen", "purple4"),
    rel_heights = c(1, 0.1),
    facet_label_prefix = names(figs),
    facet_labels = compact_pvd_facet_labels(
      figs = figs,
      facet_label_prefix = facet_label_prefix
    ),
    vjust = 1.5,
    ...) {
  # prepare data from figure list
  #   unlike the other functions, the data will remain in a list, not combined
  if (show_uncert) {
    figs_plot <- lapply(
      figs,
      function(x) tmp_data_prep(x, show_uncert)
    )
  } else {
    figs_plot <- lapply(
      figs,
      function(x) tmp_data_prep(x, show_uncert)
    )
  }

  # add the figure title as list names
  names(figs_plot) <- facet_labels

  # create plot for each panel
  p <- lapply(
    seq_along(figs_plot),
    function(x) {
      tmp_func(
        figs_plot[[x]],
        y_position = dplyr::if_else(
          x %% 2 == 0,
          "right",
          "left"
        ),
        panel_title = names(figs_plot)[x],
        scale_colors = scale_colors,
        y_text_size = y_text_size,
        legend.position = legend.position,
        tile_height = tile_height,
        tile_width = tile_width,
        ...
      )
    }
  )

  cowplot::plot_grid(
    plotlist = p,
    nrow = length(figs) / 2,
    ncol = 2,
    labels = "AUTO",
    vjust = vjust
  ) |>
    cowplot::plot_grid(
      horizontal_greyscale_legend,
      nrow = 2,
      rel_heights = rel_heights
    )
}
