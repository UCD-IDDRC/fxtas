test_that("results are consistent", {

  dat <- readr::read_rds(testthat::test_path("fixtures", "gp34_nodata.rds"))

  labels_vec <- dat |>
    select(all_of(MRI_vars())) |>
    set_mri_var_labels() |>
    labelled::get_variable_labels(null_action = "skip") |>
    unlist()

  labels_df <- tibble(vars = names(labels_vec), labels = labels_vec) |>
    arrange(vars)

  labels_df |>
    ssdtools:::expect_snapshot_data(name = "mri-labels")

})
