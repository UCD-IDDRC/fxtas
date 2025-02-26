test_that("results are consistent", {
  sim_subtype_and_stage_table |>
    stage_barplot() |>
    vdiffr::expect_doppelganger(title = "stage-barplot")
})
