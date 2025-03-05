test_that("results are consistent", {
  test_data_v1 |>
    graph_CGG_repeats() |>
    vdiffr::expect_doppelganger(title = "unstratified")

  test_data_v1 |>
    graph_CGG_repeats(cols = ggplot2::vars(Gender)) |>
    vdiffr::expect_doppelganger(title = "stratified")
})
