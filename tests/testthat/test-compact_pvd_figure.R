test_that("`compact_pvd_figure()` produces consistent results", {
  size.y = 11
  figs = extract_figs_from_pickle(
    size.y = size.y,
    use_rds = TRUE,
    n_s = 3,
    rda_filename = "data.RData",
    dataset_name = "sample_data",
    output_folder = fs::path_package("extdata/sim_data", package = "fxtas")
  )

  y_text_size = 11
  tile_height = 1
  # facet_label_size = 8
  facet_label_prefix = names(figs)
  scale_colors = c("red", "blue", "purple4")
  plot_dataset <- compact_pvd_data_prep(figs = figs)
  group_colors <- group_colors(figs)
  # facet labels
  facet_names <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = NULL)
  # generate figure
  legend_text_size = grid::unit(7, "pt")

  temp_plot <- plot_dataset |>
    pvd_scatter(nrow_colors = 1, group_colors = group_colors,
                legend_text_size = legend_text_size)

  group_color_legend <- temp_plot |> cowplot::get_legend()

  plot1 <- compact_pvd_figure(
    plot_dataset,
    tile_height = tile_height,
    y_text_size = y_text_size,
    facet_names = facet_names,
    # facet_label_size = facet_label_size,
    legend.position = "none",
    scale_colors = scale_colors,
    group_colors = group_colors,
    group_color_legend = group_color_legend,
    legend_text_size = legend_text_size
  )

  plot1 |>
    vdiffr::expect_doppelganger(title = "compact_pvd_figure")

  plot2 <- compact_pvd_figure(
    plot_dataset,
    tile_height = tile_height,
    y_text_size = y_text_size,
    facet_names = facet_names,
    # facet_label_size = facet_label_size,
    legend.position = "bottom",
    scale_colors = scale_colors,
    group_colors = group_colors,
    group_color_legend = group_color_legend,
    legend_text_size = legend_text_size
  )

  plot2 |>
    vdiffr::expect_doppelganger(title = "compact_pvd_figure-multiscale")

  plot3 <- compact_pvd_figure(
    plot_dataset,
    tile_height = tile_height,
    y_text_size = y_text_size,
    facet_names = facet_names,
    # facet_label_size = facet_label_size,
    legend.position = "none",
    show_grayscale_legend = FALSE,
    scale_colors = scale_colors,
    group_colors = group_colors,
    group_color_legend = group_color_legend,
    legend_text_size = legend_text_size
  )

  plot3 |>
    vdiffr::expect_doppelganger(title = "compact_pvd_figure-no-grayscale")



})
