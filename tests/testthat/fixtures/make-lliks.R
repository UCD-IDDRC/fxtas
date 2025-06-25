N_S_max <- 8L

results_v1 <- extract_results_from_pickles(
  use_rds = TRUE,
  n_s = 1:N_S_max,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = "output/output.fixed_CV"
)

lliks <- results_v1 |>
  sapply(FUN = function(x) x$samples_likelihood)

lliks |>
  readr::write_rds(
    testthat::test_path("fixtures", "lliks.rds")
  )
