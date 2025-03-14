file_path = fs::path_package("extdata/sim_data/synthetic_data.xlsx", package = "fxtas")
library(readxl)
set.seed(1)
sim_data =
  file_path |>
  readxl::read_excel() |>
  dplyr::mutate(
    Male = (.data$Sex == "Male"),
    Age = runif(n = n(), 40, 80),
         across(
           .cols = starts_with("Biomarker"),
           .fns = as.factor)) |>
  relocate(c("Male", "Age"), .after = "Sex")

usethis::use_data(sim_data, overwrite = TRUE)

sim_results_3s =
  fs::path_package("extdata/sim_data/", package = "fxtas") |>
  extract_results_from_pickle(n_s = 3,
                              output_folder = _,
                              use_rds = FALSE)

sim_subtype_and_stage_table = sim_results_3s |>
  extract_subtype_and_stage_table()

usethis::use_data(sim_subtype_and_stage_table, overwrite = TRUE)


