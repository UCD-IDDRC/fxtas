compute_bumpplot_y_positions <- function(plot_data) {
  plot_data <- plot_data |>
    mutate(
      .by =  "facet",
      distance_from_stage_0 = .data$Order,
      distance_from_stage_1 = .data$Order -
        .data$Order[.data$`event name` == "FXTAS Stage: 1"],
      distance_from_stage_2 = .data$Order -
        .data$Order[.data$`event name` == "FXTAS Stage: 2"],
      distance_from_stage_3 = .data$Order -
        .data$Order[.data$`event name` == "FXTAS Stage: 3"],
      distance_from_stage_4 = .data$Order -
        .data$Order[.data$`event name` == "FXTAS Stage: 4"],
      distance_from_stage_5 = .data$Order -
        .data$Order[.data$`event name` == "FXTAS Stage: 5"],
    ) |>
    mutate(
      stage_group = case_when(
        distance_from_stage_1 <= 0 ~ 0,
        distance_from_stage_2 <= 0 ~ 1,
        distance_from_stage_3 <= 0 ~ 2,
        distance_from_stage_4 <= 0 ~ 3,
        distance_from_stage_5 <= 0 ~ 4,
        TRUE ~ 5
      )
    )

  n_in_group <- plot_data |>
    summarize(
      .by = c("stage_group", "facet"),
      n_in_group = n()
    ) |>
    summarize(
      .by = "stage_group",
      n_in_group = max(.data$n_in_group)
    ) |>
    arrange(.data$stage_group) |>
    mutate(
      group_start = c(0, cumsum(.data$n_in_group) |> head(-1)),
      group_end = cumsum(.data$n_in_group)
    )

  plot_data |>
    left_join(
      n_in_group, by = "stage_group"
    ) |>
    mutate(
      .by = c("stage_group", "facet"),
      distance_from_stage_start =
        .data$stage_group |>
        case_match(
          0 ~ .data$distance_from_stage_0,
          1 ~ .data$distance_from_stage_1,
          2 ~ .data$distance_from_stage_2,
          3 ~ .data$distance_from_stage_3,
          4 ~ .data$distance_from_stage_4,
          5 ~ .data$distance_from_stage_5),

      y = .data$group_start +
        (.data$n_in_group) *
        (.data$distance_from_stage_start / (max(.data$distance_from_stage_start)))
    )
}
