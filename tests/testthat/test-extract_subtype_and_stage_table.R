test_that("results are consistent", {

  reticulate::use_condaenv("fxtas39", required = TRUE,
                           conda = "auto")
  reticulate::py_discover_config(
    required_module = "pySuStaIn"
  )$required_module_path |>
    is.null() |>
    testthat::skip_if()

  results00 <- readr::read_rds(
    testthat::test_path("fixtures", "results00.rds")
  )

  table1 = results00 |> extract_subtype_and_stage_table(n_s = 3)

  ssdtools:::expect_snapshot_data(table1, name = "SuStaIn_ML_table")

  table2 = results00 |> extract_subtype_and_stage_table(
    n_s = 3,
    subtype_order = c(3, 1, 2))

  ssdtools:::expect_snapshot_data(table2, name = "SuStaIn_ML_table-reordered")

})

