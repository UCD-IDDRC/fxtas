test_that("results are consistent", {


  example_likelihoods |>
    graph_likelihoods_v2(alpha = 0.5) |>
    vdiffr::expect_doppelganger(title = "likelihoods")
})

test_that("results are consistent with real data", {
  lliks  <-
    readr::read_rds(
      testthat::test_path("fixtures", "lliks.rds")
    )


  lliks |>
    graph_likelihoods_v2(alpha = 0.5) |>
    vdiffr::expect_doppelganger(title = "lliks-fxtas")
})

test_that("results are consistent with legend", {
  lliks  <-
    readr::read_rds(
      testthat::test_path("fixtures", "lliks.rds")
    )

  lliks |>
    graph_likelihoods_v2(alpha = 0.5, legend = TRUE) |>
    vdiffr::expect_doppelganger(title = "lliks-fxtas-legend")
})

test_that("results are consistent with facet", {
  lliks  <-
    readr::read_rds(
      testthat::test_path("fixtures", "lliks.rds")
    )

  lliks |>
    graph_likelihoods_v2(alpha = 0.5, facet = TRUE) |>
    vdiffr::expect_doppelganger(title = "lliks-fxtas-facet")
})
