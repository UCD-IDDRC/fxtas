#' @title Plot SuStaIn Sequential Estimate
#' @inheritParams plot_compact_pvd_est
#' @param tile_width todo
#' @param rel_heights relative heights of the plot and the legend
#' @param ... arguments passed to `tmp_func()`
#' @export
#' @example inst/examples/exm-plot_compact_pvd_est2.R
#'
plot_compact_pvd_est2 <- function(
    figs,
    tile_height = 1,
    tile_width = 1,
    y_text_size = 9,
    legend.position = "none", # nolint: object_name_linter
    scale_colors = c("red", "blue", "purple4", "darkgreen", "magenta"),
    rel_heights = c(1, 0.1),
    ...) {
  # prepare data from figure list
  #   unlike the other functions, the data will remain in a list, not combined
  figs_plot <- lapply(
    figs,
    function(x) tmp_data_prep(x)
  )
  # add the figure title as list names
  names(figs_plot) <- c(
    figs[[1]]$labels$title,
    figs[[2]]$labels$title,
    figs[[3]]$labels$title,
    figs[[4]]$labels$title
  )

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
    nrow = 2,
    ncol = 2
  ) |>
    cowplot::plot_grid(
      horizontal_greyscale_legend,
      nrow = 2,
      rel_heights = rel_heights
    )
}
