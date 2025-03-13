test_that("results are consistent", {

  file_path <- testthat::test_path("fixtures", "gp34_raw.rds")

  skip_if_not(file.exists(file_path))

  d1 <- readr::read_rds(file_path) |>
    dplyr::select(
      contains("ataxia", ignore.case = TRUE),
      -contains("age of onset")
    ) |>
    distinct()

  withr::local_package("dplyr")
  snap <-
    d1 |>
    clean_ataxia() |>
    relocate(sort(tidyselect::peek_vars()))

  snap |>
    ssdtools:::expect_snapshot_data(name = "ataxia-vars")



})
