size_y <- 11
figs <- extract_figs_from_pickle(
  use_rdS = TRUE,
  size.y = size_y,
  n_s = 3,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = fs::path_package("extdata/sim_data", package = "fxtas")
)

y_text_size <- 11
tile_height <- 1
facet_label_prefix <- names(figs)
legend_position <- "none"
scale_colors <- c("red", "blue", "purple4")
plot_dataset <- fxtas:::compact_pvd_data_prep(figs = figs)
# facet labels
facet_names <- fxtas:::compact_pvd_facet_labels(
  figs = figs,
  facet_label_prefix = facet_label_prefix
)
nrow_colors <- 1
group_colors <- figs |> group_colors()

temp_plot <- plot_dataset |> pvd_scatter(
  group_colors = group_colors,
  nrow_colors = nrow_colors
)

group_color_legend <- temp_plot |> cowplot::get_legend()

# generate figure
compact_pvd_figure(
  plot_dataset,
  tile_height = tile_height,
  y_text_size = y_text_size,
  facet_names = facet_names,
  legend.position = legend_position,
  scale_colors = scale_colors,
  group_colors = group_colors,
  group_color_legend = group_color_legend
)
