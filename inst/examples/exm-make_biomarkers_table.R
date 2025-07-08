biomarker_group_list <- list(
  "group 1" = c("Biomarker 1", "Biomarker 2"),
  "group 2" = c("Biomarker 3", "Biomarker 4"),
  "group 3" = "Biomarker 5"
)
biomarker_groups <- compile_biomarker_groups_table(
  dataset = sim_data,
  biomarker_group_list = biomarker_group_list
)

biomarker_varnames <-
  biomarker_groups |>
  dplyr::pull("biomarker")

biomarker_levels <-
  sim_data |>
  get_levels(biomarker_varnames)

biomarker_events_table <-
  construct_biomarker_events_table(
    biomarker_levels,
    biomarker_groups = biomarker_groups
  )

sim_data |> make_biomarkers_table(
  biomarker_events_table = biomarker_events_table,
  biomarker_varnames = biomarker_varnames,
  stratifying_var_names = "Sex"
)
