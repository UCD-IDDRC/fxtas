sim_data |>
  dplyr::filter(Category == "Patient") |>
  combine_subtype_and_demos(
    subtype_data = sim_subtype_and_stage_table
  )
