extract_PFs <- function(
    samples_sequence,
    biomarker_events_table,
    biomarker_plot_order,
    biomarker_groups) {
  samples_sequence |>
    t() |>
    compute_position_frequencies() |>
    simplify_biomarker_names(cols = "event name") |>
    # get biomarker names
    left_join(
      biomarker_events_table |>
        simplify_biomarker_names(cols = c("biomarker", "biomarker_level")),
      by = c("event name" = "biomarker_level")
    ) |>
    # get biomarker groups and colors
    left_join(
      biomarker_groups |>
        simplify_biomarker_names(cols = "biomarker"),
      by = c("biomarker")
    ) |>
    arrange_position_frequencies(
      biomarker_order = biomarker_plot_order
    ) |>
    dplyr::mutate(
      `event label` =
        glue("<i style='color:{group_color}'>{`row number and name`}</i>"),
      `event label` = if_else(
        .data$biomarker_group == "stage",
        paste0("**", .data$`event label`, "**"),
        .data$`event label`
      ),
      `event label` =
        .data$`event label` |>
        factor(levels = .data$`event label` |> unique())
    )
}
