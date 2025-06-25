pfs <- c("Stiff gait", "Masked faces", "Increased tone", "pill-rolling tremor exam")
gp34_raw |>
  distinct(
    c("parkinsonian features", pfs) |>
      all_of() |>
      across()
  ) |>
  readr::write_rds("tests/testthat/fixtures/pfs-distinct.rds")
