# helpers
pvd_bumpplot_preprocessing <- function(
    data,
    facet_labels,
    events_to_highlight,
    subtype_x) {

  data <- data |>
    left_join(
      events_to_highlight,
      by = c("event name" = "event_name")
    )

  data |>
    dplyr::mutate(
      # extract order number
      Order =
        .data$`row number and name` |>
        stringi::stri_extract_first_regex("[0-9]+") |>
        as.integer(),
      # right justify left facet, left justify right facet
      # hjust = ifelse(
      #   (.data$facet == facet_labels[1] | .data$facet == facet_labels[3]),
      #   1,
      #   0
      # ),
      # made FXTAS Stage label bold
      `event label` = ifelse(
        .data$biomarker == "FXTAS Stage",
        paste0("<b>", .data$`event label`, "</b>"),
        as.character(.data$`event label`)
      )
    ) |>
    dplyr::select(
      all_of(
        c(
          "event name",
          "facet",
          "Order",
          "biomarker",
          "group_color",
          "event label",
          # "hjust",
          "highlight_color",
          "line_color"
        )
      )
    ) |>
    unique() |>
    arrange(.data$`event name`, .data$facet) |>
    dplyr::mutate(
      linesize = ifelse(
        .data$biomarker == "FXTAS Stage",
        1.5,
        1
      ),
      background = .data$highlight_color |> tidyr::replace_na("#FFF")
    ) |>
    dplyr::left_join(
      x = _,
      y  = data.frame(
        facet_label = facet_labels,
        facet_order = subtype_x
      ),
      by = c("facet" = "facet_label")
    )

}
