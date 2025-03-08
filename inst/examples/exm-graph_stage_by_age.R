output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

results <- extract_results_from_pickle(
  n_s = 3,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = output_path
)

patient_data <-
  sim_data |>
  dplyr::filter(Category == "Patient")

stages <-
  results$subtype_and_stage_table |>
  dplyr::mutate(
    age = patient_data$Age,
    id = patient_data$Index,
    sex = patient_data$Sex
  )

stages |> graph_stage_by_age()
