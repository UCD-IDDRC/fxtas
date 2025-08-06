tremor_data <-
  trax_gp34_all |>
  dplyr::select(
    dplyr::contains("tremor") & !dplyr::contains("onset")
  ) |>
  dplyr::distinct()

tremor_data |>
  readr::write_rds("tests/testthat/fixtures/tremor_data.rds")
