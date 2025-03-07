test_that("results are consistent", {
    testthat::skip_if_not(exists("gp3"))

  withr::local_package("dplyr")
  gp34 <-
    bind_rows("GP3" = gp3, "GP4" = gp4, .id = "Study")

  apoe <- gp34 |> fix_ApoE()

  apoe |>
    pull("ApoE") |>
    unique() |>
    expect_snapshot_value(style = "deparse")

  apoe |>
    arrange(`FXS ID`, `Event Name`) |>
    select(`FXS ID`, `Event Name`, ApoE, `ApoE (original)`) |>
    ssdtools:::expect_snapshot_data(name = "real_data")

})
