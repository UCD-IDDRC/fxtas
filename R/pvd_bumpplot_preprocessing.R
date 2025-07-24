# helpers
pvd_bumpplot_preprocessing <- function(
    data,
    facet_labels,
    events_to_highlight,
    highlight_color,
    subtype_x) {
  data |>
    dplyr::mutate(
      # extract order number
      Order =
        .data$`row number and name` |>
        stringi::stri_extract_first_regex("[0-9]+") |>
        as.integer(),
      # right justify left facet, left justify right facet
      hjust = ifelse(
        (.data$facet == facet_labels[1] | .data$facet == facet_labels[3]),
        1,
        0
      ),
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
          "hjust"
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
      facet_order = case_when(
        facet == facet_labels[1] ~ subtype_x[1],
        facet == facet_labels[2] ~ subtype_x[2],
        facet == facet_labels[3] ~ subtype_x[3],
        facet == facet_labels[4] ~ subtype_x[4]
      ),
      background = dplyr::if_else(
        condition = .data$`event name` %in% events_to_highlight,
        true = highlight_color,
        false = "#FFF"
      )
    )
}
