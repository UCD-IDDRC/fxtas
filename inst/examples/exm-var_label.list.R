output_folder <-
  fs::path_package("extdata/sim_data/", package = "fxtas")

biomarker_levels =
  output_folder |>
  fs::path("biomarker_levels.rds") |>
  readr::read_rds()

biomarker_levels |> var_label()
