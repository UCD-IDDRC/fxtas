test_that("results are consistent", {

  file_path <- testthat::test_path("fixtures", "gp34_raw.rds")

  skip_if_not(file.exists(file_path))

  d1 <- readr::read_rds(file_path)

  withr::local_package("dplyr")
  snap <-
    d1 |>
    dplyr::select(contains("ataxia", ignore.case = TRUE)) |>
    distinct() |>
    clean_ataxia()

  snap |>
    ssdtools:::expect_snapshot_data(name = "ataxia-vars")



})
