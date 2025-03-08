test_that("results are consistent", {

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
    vwidth = 992,
    vheight = 744,
    name = "prob_correct_table",
    engine = "testthat"
  )
})
