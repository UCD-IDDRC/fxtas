test_that("results are consistent", {
  biomarker_groups <- compile_biomarker_groups_table(
    dataset = test_data_v1
  )

  biomarker_varnames <-
    biomarker_groups |>
    dplyr::pull("biomarker")

  biomarker_levels <-
    test_data_v1 |>
    get_levels(biomarker_varnames)

  make_biomarker_events_table(
    biomarker_levels,
    biomarker_groups
  ) |> expect_snapshot_data(name = "table1")

})
