#' plot_compact_pvd: data prep
#'
#' @param figs a [list] of `PVD` objects
#' @param biomarker_order a [character] vector specifying the
#' order of biomarkers to use
#' @returns a [tibble::tbl_df]
#' @export
#' @keywords internal
compact_pvd_data_prep <- function(figs, biomarker_order = NULL) {
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
    dplyr::select(all_of(c(
      "row number and name", "event name", "biomarker"
    ))) |>
    dplyr::mutate(
      Order =
        sub("\\D*(\\d+).*", "\\1", .data$`row number and name`) |>
          as.numeric()
    ) |>
    dplyr::mutate(
      `event order` = min(.data$Order),
      .by = "biomarker"
    ) |>
    # dplyr::select(
    #   biomarker, position
    # ) |>
    arrange(across(all_of("event order"))) |>
    dplyr::mutate(
      biomarker = .data$biomarker |> forcats::fct_inorder()
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
    dplyr::mutate(biomarker = factor(.data$biomarker, levels = biomarker_order)) |>
    # arrange by biomarker levels
    arrange(across(all_of("biomarker"))) |>
    # create biomarker labels for figure
    dplyr::mutate(
      biomarker_label = glue::glue("<i style='color:{group_color}'>{biomarker}</i>") |>
        forcats::fct_inorder()
    ) |>
    dplyr::select(all_of(
      c(
        "facet",
        "biomarker",
        "biomarker_label",
        "position",
        "proportion",
        "level"
      )
    ))

  return(plot_dataset)
}

#   if(length(figs) > 1){
#     # extract data from pvd fig object
#     dataset <- dplyr::bind_rows(
#       lapply(
#         1:length(figs),
#         function(x) figs[[x]]$data
#       ),
#       .id = "facet"
#     )
#
#     # determine biomarker event order
#     event_order <- dataset |>
#       dplyr::select(`row number and name`, `event name`, biomarker) |>
#       dplyr::mutate(
#         Order = sub("\\D*(\\d+).*", "\\1", `row number and name`) |> as.numeric()
#       ) |>
#       dplyr::mutate(
#         `event order` = min(Order),
#         .by = `biomarker`
#       ) |>
#       # dplyr::select(
#       #   biomarker, position
#       # ) |>
#       arrange(`event order`) |>
#       dplyr::mutate(
#         biomarker = forcats::fct_inorder(biomarker)
#       ) |>
#       dplyr::select(biomarker, `event order`) |>
#       unique()
#
#     # update biomarker levels in dataset
#     plot_dataset <- dataset |>
#       # convert biomarker to factor with event order levels
#       dplyr::mutate(
#         biomarker = factor(
#           biomarker,
#           levels = levels(event_order$biomarker)
#         )
#       ) |>
#       # arrange by biomarker levels
#       arrange(biomarker) |>
#       # create biomarker labels for figure
#       dplyr::mutate(
#         biomarker_label = glue::glue(
#           "<i style='color:{group_color}'>{biomarker}</i>"
#         ) |>
#           forcats::fct_inorder()
#       ) |>
#       dplyr::select(
#         facet, biomarker, biomarker_label, position, proportion, level
#       )
#   }
#
#
# }
