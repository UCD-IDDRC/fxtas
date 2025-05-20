test_that("results are consistent", {
  biomarker_group_list <-
    test_data_v1 |>
    compile_biomarker_group_list() |>
    expect_snapshot_value(style = "deparse")
})
