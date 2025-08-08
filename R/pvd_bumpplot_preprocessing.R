# helpers
pvd_bumpplot_preprocessing <- function(
    data,
    facet_names,
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
      # made FXTAS Stage label bold
      `event label` = ifelse(
        test = .data$biomarker == "FXTAS Stage",
        yes = paste0("<b>", .data$`event label`, "</b>"),
        no = as.character(.data$`event label`) |>
          collapse_WM() |>
          collapse_hyperintensity() |>
          collapse_parentheticals() |>
          collapse_impairment() |>  # nolint
          # collapse_moderate() |>
          collapse_five()
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
          # "hjust",
          "highlight_color",
          "line_color"
        )
      )
    ) |>
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
        facet_names = facet_names,
        facet_label = facet_labels,
        facet_order = subtype_x
      ),
      by = c("facet" = "facet_names")
    )

}
