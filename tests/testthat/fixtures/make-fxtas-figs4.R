
reticulate::use_condaenv("fxtas39", required = TRUE, conda = "auto")
output_folder <-
  "output/output.fixed_CV-scid-no-subthres/"

n_s_selected <- 4
subtype_order <- c(3,1,4,2)
results_cv_max <- extract_results_from_pickle(
  n_s = n_s_selected,
  use_rds = FALSE,
  dataset_name = dataset_name,
  output_folder = output_folder,
  subtype_order = subtype_order
)
figs <- results_cv_max |> plot_positional_var()

figs |>
  readr::write_rds(
    testthat::test_path("fixtures", "fxtas-figs4.rds")
  )
