reticulate::use_condaenv("fxtas39", required = TRUE, conda = "auto")
library(fxtas)


size.y <- 8
output_folder <-
  "output/output.fixed_CV-scid-no-subthres/"

fig_females_first <- extract_figs_from_pickle(
  use_rds = FALSE,
  size.y = size.y,
  n_s = 1,
  dataset_name = "females",
  output_folder = output_folder
)

fig_males_first <- extract_figs_from_pickle(
  use_rds = FALSE,
  size.y = size.y,
  n_s = 1,
  dataset_name = "males",
  output_folder = output_folder
)

pvd_list_by_sex <- list(
  "Males:" = fig_males_first,
  "Females:" = fig_females_first
)

pvd_list_by_sex |>
  readr::write_rds(
    testthat::test_path("fixtures", "pvd_list_by_sex.rds")
  )
