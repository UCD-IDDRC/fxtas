test_that("results are consistent", {

  lliks  <-
    readr::read_rds(
      testthat::test_path("fixtures", "lliks.rds")
    )

  lliks |>
    format_likelihoods() |>
    expect_snapshot_data(name = "lliks-formatted")

})
