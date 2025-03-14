test_that("`extract_subtype_and_stage_table()` produces consistent results", {

  results00 <- readr::read_rds(
    testthat::test_path("fixtures", "results00.rds")
  )

  table1 = results00 |> extract_subtype_and_stage_table(n_s = 3)

  ssdtools:::expect_snapshot_data(table1, name = "SuStaIn_ML_table")

})
