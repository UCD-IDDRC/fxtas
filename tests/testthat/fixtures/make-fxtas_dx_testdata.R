library(dplyr)
to_save <- gp34_raw |>
  select(mds_fxtas_dx, new_mds_fxtas_dx) |>
  distinct() |>
  arrange(mds_fxtas_dx, new_mds_fxtas_dx)

to_save |>
  readr::write_rds(
    testthat::test_path("fixtures", "fxtas_dx_testdata.rds")
  )
