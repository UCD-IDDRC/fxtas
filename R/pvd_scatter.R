#' Scatterplot comparing two PVDs for the same outcomes
#'
#' @param plot_dataset a [data.frame]
#' @param nrow_colors an [integer]
#' @param group_colors palette for [ggplot2::scale_color_manual]
#' @param legend_text_size a [grid::unit]
#'
#' @returns a [ggplot2::ggplot]
#' @export
#' @keywords internal
#' @example inst/examples/exm-pvd_scatter.R
pvd_scatter <- function(
    plot_dataset,
    nrow_colors,
    group_colors,
    legend_text_size = grid::unit(7, "pt")) {
  subtypes <- plot_dataset$facet |> unique() |> as.character()

  temp_data <- plot_dataset |>
    slice_head(
      n = 1,
      by = c("facet", "event name")
    ) |>
    tidyr::pivot_wider(
      id_cols = c("biomarker_group", "event name"),
      names_from = "facet",
      values_from = "position"
    )

  temp_plot <- temp_data |>
    ggplot() +
    aes(
      x = .data[[subtypes[1]]],
      y = .data[[subtypes[2]]],
      col = .data$biomarker_group
    ) +
    geom_point() +
    scale_color_manual(
      name = "Symptom category:",
      guide = ggh4x::guide_stringlegend(
        nrow = nrow_colors,
      ),
      values = group_colors
    ) +
    theme(
      legend.position = "bottom",
      # add color scale info in figure caption:
      legend.text = element_text(size = legend_text_size),
      legend.title = ggtext::element_markdown(size = legend_text_size)
    )


  return(temp_plot)
}
