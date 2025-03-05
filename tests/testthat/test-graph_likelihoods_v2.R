test_that("results are consistent", {


  example_likelihoods |>
    graph_likelihoods_v2(alpha = 0.5) |>
    vdiffr::expect_doppelganger(title = "likelihoods")
})
