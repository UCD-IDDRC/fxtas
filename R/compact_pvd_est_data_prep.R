#' plot_compact_pvd_est: data prep
#'
#' @param figs a [list] of PVDs


compact_pvd_est_data_prep <- function(figs){
  if(length(figs) == 1){
    # extract data from pvd fig object
    dataset <- dplyr::bind_rows(figs[[1]]$data, .id = "facet")
  } else {
    # extract data from list of pvd fig object
    dataset <- dplyr::bind_rows(
      lapply(
        seq_along(figs),
        function(x) figs[[x]]$data
      ),
      .id = "facet"
    )
  }

  # determine biomarker event order
  event_order <- dataset |>
    dplyr::filter(.data$facet == 1) |>
    dplyr::select(
      all_of(
        c(
          "row number and name",
          "event name",
          "biomarker"
        )
      )
    ) |>
    dplyr::mutate(
      Order =
        .data$`row number and name` |>
        stringr::str_replace("\\D*(\\d+).*", "\\1") |>
        as.numeric()
    ) |>
    dplyr::mutate(
      `event order` = min(.data$Order),
      .by = all_of("biomarker")
    ) |>
    # dplyr::select(
    #   biomarker, position
    # ) |>
    arrange(across(all_of("event order"))) |>
    dplyr::mutate(
      biomarker = .data$biomarker |> forcats::fct_inorder()
    ) |>
    dplyr::select(
      all_of(
        c(
          "biomarker",
          "event order"
        )
      )
    ) |>
    unique()

  event_order_facet <- dataset |>
    dplyr::select(
      "facet",
      "row number and name",
      "event name",
      "biomarker") |>
    dplyr::mutate(
      Order =
        sub(
          "\\D*(\\d+).*",
          "\\1",
          .data$`row number and name`
        ) |>
        as.numeric()
    ) |>
    unique()

  plot_dataset <- merge(
    event_order_facet,
    dataset,
    by = c("facet", "row number and name", "event name", "biomarker")
  ) |>
    dplyr::filter(
      .data$position == .data$Order
    ) |>
    # convert biomarker to factor with event order levels
    dplyr::mutate(
      biomarker = factor(
        .data$biomarker,
        levels = levels(event_order$biomarker)
      )
    ) |>
    # arrange by biomarker levels
    arrange(across(all_of("biomarker"))) |>
    # create biomarker labels for figure
    dplyr::mutate(
      biomarker_label = glue::glue(
        "<i style='color:{group_color}'>{biomarker}</i>"
      ) |>
        forcats::fct_inorder()
    ) |>
    dplyr::select(
      "facet",
      "biomarker",
      "biomarker_label",
      "position",
      "proportion",
      "level"
    )


  return(plot_dataset)
}
