reticulate::use_condaenv("fxtas39", required = TRUE, conda = "~/miniforge3/condabin/conda")

results <- extract_results_from_pickle(
  n_s = 4,
  dataset_name = "sample_data",
  output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
  use_rds = FALSE
)

figs <- results |> plot_positional_var()

# results |>
#   readr::write_rds(
#     testthat::test_path("fixtures", "sim-results-4.rds")
#   )


figs |>
  readr::write_rds(
    testthat::test_path("fixtures", "sim-figs-4.rds")
  )
