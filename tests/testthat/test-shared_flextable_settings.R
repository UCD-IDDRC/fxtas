test_that("results are consistent", {
  prob_correct <-
    testthat::test_path("fixtures", "prob_correct.rds") |>
    readr::read_rds()

  withr::local_package("flextable")
  ft = prob_correct |>
    flextable::flextable() |>
    shared_flextable_settings() |>
    flextable::width(width = 1)

  ft |>
    flextable::gen_grob(fit = "auto") |>
    vdiffr::expect_doppelganger(title = "prob_correct_table")

})
