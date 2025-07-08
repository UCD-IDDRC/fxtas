biomarker_groups <- compile_biomarker_groups_table(
  dataset = test_data_v1
)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  test_data_v1 |>
  get_levels(biomarker_varnames)

construct_biomarker_events_table(
  biomarker_levels,
  biomarker_groups
)
