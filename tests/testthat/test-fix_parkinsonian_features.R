test_that("results are consistent", {
  pfs_distinct <-
    testthat::test_path("fixtures", "pfs-distinct.rds") |>
    readr::read_rds()
  pfs_distinct |>
    fix_parkinsonian_features() |>
    expect_snapshot_data(name = "pfs")
})
