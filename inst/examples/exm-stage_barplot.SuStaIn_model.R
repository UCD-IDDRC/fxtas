output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

results <-
  extract_results_from_pickle(
    output_folder = output_path,
    use_rds = TRUE,
    n_s = 3
  )

results |>
  stage_barplot()
