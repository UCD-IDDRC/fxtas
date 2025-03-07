test_that("results are consistent", {

  # something weird was happening with the righthand border on github;
  # judging from `test-borders.R` in {flextable}, it seems like the
  # borders don't work well in CI or CRAN, so we'll skip this test

  testthat::skip_on_ci()
  testthat::skip_on_cran()

  prob_correct <-
    testthat::test_path("fixtures", "prob_correct.rds") |>
    readr::read_rds()

  withr::local_package("flextable")
  ft = prob_correct |>
    flextable::flextable() |>
    shared_flextable_settings() |>
    flextable::width(width = 1)

  html_file <- tempfile(fileext = ".html")
  flextable::save_as_html(ft, path = html_file)
  doconv::expect_snapshot_html(
    x = html_file,
    name = "prob_correct_table",
    engine = "testthat"
  )
})
