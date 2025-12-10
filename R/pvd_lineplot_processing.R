pvd_lineplot_preprocessing <- function(
    data,
    facet_labels,
    events_to_highlight,
    highlight_color,
    x_positions = c(1, 1.15)) {
  data |>
    dplyr::mutate(
      # extract order number
      Order =
        .data$`row number and name` |>
        stringi::stri_extract_first_regex("[0-9]+") |>
        as.integer(),
      # right justify left facet, left justify right facet
      hjust = ifelse(
        .data$facet == facet_labels[1],
        1,
        0
      ),
      `event label` = .data$`event label` |> collapse_WM(),
      # made FXTAS Stage label bold
      `event label` = ifelse(
        .data$biomarker == "FXTAS Stage",
        paste0("<b>", .data$`event label`, "</b>"),
        as.character(.data$`event label`)
      )
    ) |>
    dplyr::slice_head(
      n = 1,
      by = all_of(
        c(
          "event name",
          "facet",
          "Order",
          "biomarker",
          "group_color",
          "event label",
          "hjust"
        )
      )
    ) |>
    arrange(.data$`event name`, .data$facet) |>
    dplyr::mutate(
      # logical: did sequence change
      Changed = n_distinct(.data$Order) != 1,
      # magnitude of sequence change
      Change = -base::diff(.data$Order),
      .by = "event name"
    ) |>
    dplyr::mutate(
      linesize = ifelse(
        .data$biomarker == "FXTAS Stage",
        1.5,
        1
      ),
      facet_order = case_when(
        facet == facet_labels[1] ~ x_positions[1],
        facet == facet_labels[2] ~ x_positions[2]
      ),
      # colors of choice
      Change_color = dplyr::case_when(
        `biomarker` == "FXTAS Stage" ~ "(stage)",
        Change < 0 ~ "down",
        Change == 0 ~ "neutral",
        Change > 0 ~ "up",
      ) |>
        factor(levels = c("(stage)", "down", "neutral", "up")),
      background = dplyr::if_else(
        condition = .data$`event name` %in% events_to_highlight,
        true = highlight_color,
        false = NA
      )
    )
}
