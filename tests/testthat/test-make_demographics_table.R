test_that(
  desc = "results are consistent",
  code = {
    ft = test_data_v1 |>
      dplyr::filter(!is.na(CGG)) |>
      make_demographics_table(make_ft = FALSE)

    ft |> as.data.frame() |>
      ssdtools:::expect_snapshot_data(name = "demographics-table")
  }
)

test_that(
  desc = "results are consistent 2",
  code = {
    ft = test_data_v1 |>
      dplyr::filter(!is.na(CGG)) |>
      make_demographics_table(make_ft = TRUE)

    ft |>
      flextable::gen_grob(fit = "auto") |>
      vdiffr::expect_doppelganger(title = "demographics_table-2")

  }
)
