output_path =
  fs::path_package("extdata/sim_data", package = "fxtas")

figs = extract_figs_from_pickle(
  output_folder = output_path,
  n = 3)

figs |> plot_compact_pvd(scale_colors = c("red", "blue", "purple4"))
