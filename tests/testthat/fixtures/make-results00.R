output_path =
  fs::path_package("extdata/sim_data", package = "fxtas")

pickle_folder <- fs::path(output_path, "pickle_files")

skip_if_not(dir.exists(pickle_folder))

picklename = "sample_data_subtype2.pickle"
results00 =
  output_path |>
  fs::path("pickle_files", picklename) |>
  py_load_object() |>
  force()

to_save <- results00[c("ml_subtype", "ml_stage", "prob_ml_subtype", "prob_ml_stage")]

to_save |> readr::write_rds(
  testthat::test_path("fixtures", "results00.rds")
)
