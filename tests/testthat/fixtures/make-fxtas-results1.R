devtools::load_all()
dataset_name <- "sample_data"
reticulate::use_condaenv("fxtas39", required = TRUE, conda = "auto")
output_folder <-
  "output/output.fixed_CV-scid-no-subthres/"

n_s_selected <- 1
results_no_subtypes <- extract_results_from_pickle(
  n_s = n_s_selected,
  use_rds = TRUE,
  dataset_name = dataset_name,
  output_folder = output_folder
)

results_no_subtypes |>
  readr::write_rds(
    testthat::test_path("fixtures", "fxtas_results_overall.rds")
  )
