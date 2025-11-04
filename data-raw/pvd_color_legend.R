devtools::load_all()
output_folder <-
  "output/output.fixed_CV-scid-no-subthres/"

scale_color_indices <- c(9, 5, 7, 8, 4)
# scale_color_indices <- 1:5
scale_colors0 <- rcartocolor::carto_pal(name = "Safe")[scale_color_indices]

scale_colors1 <- scale_colors0 |>
  setNames(
    c("violet red", "royal blue", "cadet blue", "khaki", "forest green"
    )
  )

fig_both_first <- extract_figs_from_pickle(
  use_rds = TRUE,
  n_s = 1,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = output_folder
)

fig_both_first2 <-
  list(all = fig_both_first) |>
  plot_compact_pvd(
    scale_colors = scale_colors1,
    legend.position = "bottom",
    legend.box = "horizontal",
    legend.direction = "horizontal"
  ) +
  theme(legend.key.width = grid::unit(0.6, "lines"),
        legend.location = "plot")
fig_both_first2 |> print()

pvd_color_legend <- cowplot::get_legend(fig_both_first2)

usethis::use_data(pvd_color_legend, overwrite = TRUE, internal = TRUE)
