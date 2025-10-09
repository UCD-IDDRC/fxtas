# generate greyscale legend using sample data#
library(ggplot2)

output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

figs <- fxtas::extract_figs_from_pickle(
  output_folder = output_path,
  n = 3
)

plot_data <- fxtas:::compact_pvd_data_prep(figs = figs)

tile_width <- 1
tile_height = 1
level2 <- colorRampPalette(c("white", "black")) # level 2
level2_scale <- level2(100)

# scales::show_col(level2_scale)
scale_limits <- c(0, 1)
legend_text_size = grid::unit(8, "pt")
horizontal_legend_fig <- ggplot() +
  # layer for biomarker level 2
  ggplot2::geom_tile(
    data = plot_data |> dplyr::filter(level == 2),
    aes(
      x = position,
      y = forcats::fct_inorder(biomarker_label),
      fill = proportion,
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
    guide = ggplot2::guide_colorbar(title = "Pr(Stage):", order = 1)
  ) +
  theme(
    legend.direction = "horizontal",
    legend.text = element_text(size = legend_text_size),
    legend.title = ggtext::element_markdown(size = legend_text_size),
    legend.key.height = grid::unit(1, "lines"),
    legend.key.width = grid::unit(.8, "lines")
  )

horizontal_greyscale_legend <- cowplot::get_legend(horizontal_legend_fig)

usethis::use_data(
  horizontal_greyscale_legend,
  overwrite = TRUE,
  internal = TRUE
)
