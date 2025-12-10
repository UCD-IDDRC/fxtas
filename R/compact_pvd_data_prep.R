#' plot_compact_pvd: data prep
#'
#' @param figs a [list] of `PVD` objects
#' @param biomarker_order a [character] vector specifying the
#' order of biomarkers to use
#' @param biomarker_var either "biomarker" or "biomarker_label"
#' @returns a [tibble::tbl_df]
#' @export
#' @keywords internal
compact_pvd_data_prep <- function(figs,
                                  biomarker_order = NULL,
                                  biomarker_var = "biomarker_label") {
  if (length(figs) == 1) {
    # extract data from pvd fig object
    dataset <- dplyr::bind_rows(figs[[1]]$data, .id = "facet")
  } else {
    # extract data from list of pvd fig object
    dataset <-
      seq_along(figs) |>
      lapply(function(x) {
        figs[[x]]$data
      }) |>
      dplyr::bind_rows(.id = "facet")
  }

  # determine biomarker event order
  event_order <- dataset |>
    dplyr::filter(.data$facet == 1) |>
    dplyr::select(
      c("row number and name", "event name", biomarker_var) |> all_of()
    )

  event_order <- event_order |>
    dplyr::mutate(
      Order =
        sub("\\D*(\\d+).*", "\\1", .data$`row number and name`) |>
        as.numeric()
    ) |>
    dplyr::mutate(
      `event order` = min(.data$Order),
      .by = all_of(biomarker_var)
    ) |>
    arrange(.data[["event order"]]) |>
    dplyr::mutate(
      biomarker = .data[[biomarker_var]] |>
        tools::toTitleCase() |>
        Hmisc::capitalize() |>
        forcats::fct_inorder()
    ) |>
    dplyr::select(
      all_of(c("biomarker", "event order"))
    ) |>
    unique()

  if (is.null(biomarker_order)) {
    biomarker_order <- event_order$biomarker |> levels()
  }
  # update biomarker levels in dataset
  plot_dataset <- dataset |>
    # convert biomarker to factor with event order levels
    dplyr::mutate(biomarker = .data[[biomarker_var]] |>
                    tools::toTitleCase() |>
                    Hmisc::capitalize() |>
                    factor(levels = biomarker_order)) |>
    # arrange by biomarker levels
    arrange(across(all_of("biomarker"))) |>
    # create biomarker labels for figure
    dplyr::mutate(
      biomarker_label = glue::glue(
        "<span style='color:{group_color}'>{biomarker}</span>"
      ) |>
        forcats::fct_inorder()
    )

  return(plot_dataset)
}
