test_that(
  desc = "results are consistent",
  code = {
    df <- test_data_v1
    biomarker_groups <- compile_biomarker_groups_table(dataset = df)
    biomarker_varnames <-
      biomarker_groups |>
      dplyr::pull("biomarker")

    biomarker_levels <-
      df |>
      get_levels(biomarker_varnames, keep_labels = TRUE)

    biomarker_events_table <- get_biomarker_events_table(biomarker_levels)
    biomarker_events_table |>
      ssdtools:::expect_snapshot_data(name = "biomarker-events-table")
  }
)
