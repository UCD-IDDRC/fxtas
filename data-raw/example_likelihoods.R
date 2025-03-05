devtools::load_all()
output_folder = fs::path_package("extdata/sim_data", package = "fxtas")
results_v1 <- extract_results_from_pickles(
  n_s = 1:3,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = output_folder
)

example_likelihoods = results_v1 |>
  sapply(FUN = function(x) x$samples_likelihood)

usethis::use_data(example_likelihoods, overwrite = TRUE)
