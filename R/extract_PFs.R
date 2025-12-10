extract_PFs <- function(
    samples_sequence,
    biomarker_events_table,
    biomarker_plot_order,
    biomarker_groups,
    ...) {
  to_return <-
    samples_sequence |>
    t() |>
    as_tibble() |>
    compute_position_frequencies() |>
    # get biomarker names
    left_join(
      relationship = "many-to-one",
      biomarker_events_table,
      by = c("event name" = "biomarker_level")
    ) |>
    # get biomarker groups and colors
    left_join(
      relationship = "many-to-one",
      biomarker_groups,
      by = c("biomarker")
    ) |>
    simplify_biomarker_names(
      cols = c("event name", "biomarker_level", "level_labelled")
    ) |>
    arrange_position_frequencies(
      biomarker_order = biomarker_plot_order,
      ...
    ) |>
    dplyr::mutate(
      `event label` = glue(
        "<span style='color:{group_color}'>{`row number and name`}</span>"
      ),
      `event label` = if_else(
        .data$biomarker_group == "stage",
        paste0("**", .data$`event label`, "**"),
        .data$`event label`
      ),
      `event label` = .data$`event label` |> forcats::as_factor()
    )
  return(to_return)
}
