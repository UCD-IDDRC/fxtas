test_that("results are consistent", {
  cvic_sim_data$loglike_matrix |>
    plot_cv_loglik() |>
    vdiffr::expect_doppelganger(title = "cv-loglik-plot")
})
