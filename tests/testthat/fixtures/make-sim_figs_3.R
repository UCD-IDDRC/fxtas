devtools::load_all()
reticulate::use_condaenv("fxtas39", required = TRUE, conda = "auto")

results <- extract_results_from_pickle(
  n_s = 3,
  dataset_name = "sample_data",
  output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
  use_rds = FALSE,
  verbose = TRUE
)

figs <- results |> plot_positional_var()

# results |>
#   readr::write_rds(
#     testthat::test_path("fixtures", "sim-results-4.rds")
#   )


figs |>
  readr::write_rds(
    testthat::test_path("fixtures", "sim-figs-3.rds")
  )
