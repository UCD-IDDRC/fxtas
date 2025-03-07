test_that("results are consistent", {
  cvic_sim_data$CVIC |>
    plot_CVIC() |>
    vdiffr::expect_doppelganger(title = "cvic")
})
