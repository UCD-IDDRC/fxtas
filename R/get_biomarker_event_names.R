get_biomarker_event_names <- function(
    biomarker_levels,
    biomarker_events_table = get_biomarker_events_table(
      biomarker_levels
    )) {
  biomarker_events_table |> dplyr::pull("biomarker_level")
}
