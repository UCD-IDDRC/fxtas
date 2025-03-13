test_that("results are consistent", {

  dat <- readr::read_rds(testthat::test_path("fixtures", "gp34_nodata.rds"))

  x <- dat |>
    add_labels() |>
    get_variable_labels(null_action = "skip") |>
    unlist()

  labels_df <- tibble(vars = names(x), labels = x) |>
    arrange(vars)

  labels_df |>
    ssdtools:::expect_snapshot_data(name = "var-labels")

})
