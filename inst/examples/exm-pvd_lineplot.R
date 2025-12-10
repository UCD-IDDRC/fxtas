output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

figs <- extract_figs_from_pickle(
  output_folder = output_path,
  use_rds = TRUE,
  n = 3
)

figs[1:2] |> pvd_lineplot(
  group_cols = group_colors(figs)
)
