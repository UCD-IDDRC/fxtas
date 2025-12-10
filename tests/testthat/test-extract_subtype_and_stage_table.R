test_that("results are consistent", {

  results00 <- readr::read_rds(
    testthat::test_path("fixtures", "results00.rds")
  )

  table1 = results00 |> extract_subtype_and_stage_table(n_s = 3)

  expect_snapshot_data(table1, name = "SuStaIn_ML_table")

  table2 = results00 |> extract_subtype_and_stage_table(
    n_s = 3,
    subtype_order = c(3, 1, 2))

  expect_snapshot_data(table2, name = "SuStaIn_ML_table-reordered")

})

