test_that("results are consistent", {
  # skip_if_not(exists("gp34_raw"))
  test_input <-
    readr::read_rds(
      testthat::test_path("fixtures", "fxtas_dx_testdata.rds")
    )

  test_output <-
    test_input |> clean_fxtas_dx()

  test_output |>
    expect_snapshot_data(name = "fxtas-dx")

})
