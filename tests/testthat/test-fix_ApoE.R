test_that("results are consistent", {

  file_path <- testthat::test_path("fixtures", "gp34_raw.rds")

  skip_if_not(file.exists(file_path))

  withr::local_package("dplyr")

  apoe <- file_path |>
    readr::read_rds() |>
    dplyr::select(
      all_of(
        c(
          "FXS ID",
          "Event Name",
          "ApoE"
        )
      )
    ) |>
    fix_ApoE()

  apoe |>
    pull("ApoE") |>
    unique() |>
    expect_snapshot_value(style = "deparse")

  apoe |>
    arrange(`FXS ID`, `Event Name`) |>
    select(`FXS ID`, ApoE, `ApoE (original)`) |>
    ssdtools:::expect_snapshot_data(name = "real_data")

})
