devtools::load_all()
reticulate::use_condaenv("fxtas39", required = TRUE, conda = "auto")

results <- extract_results_from_pickle(
  n_s = 4,
  dataset_name = "sample_data",
  output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
  use_rds = FALSE
)

# don't save `results` to .rds; too big


figs <- results |> plot_positional_var()

figs |>
  readr::write_rds(
    testthat::test_path("fixtures", "sim-figs-4.rds")
  )
