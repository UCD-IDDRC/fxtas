#' @title Display Sequential Order of Events by Subtype
#' @param figs A [list] of todo
#' @param facet_label_prefixes [character]: prefixes for facet labels
#' @param facet_labels todo
#' @param facet_names [character]: facet names
#' @param events_to_highlight todo
#' @param y_title_size todo
#' @param text_size todo
#' @param y_text_size todo
#' @param x_text_size todo
#' @param min_alpha todo
#' @param max_alpha todo
#' @param stage_alpha todo
#' @param y_lab todo
#' @param mult [numeric] vector
#' @param subtype_x Vector of x-axis value for the subtypes.
#' @param align_stage [logical] whether to align by FXTAS stage
#' @param use_group_colors [logical]: whether to use existing group colors
#' or custom line colors from `events_to_highlight` argument
#' @param group_colors a named [character] [vector]
#' mapping from `biomarker_group` to a color palette
#' @param legend_text_size [grid::unit]: legend text size
#' @param ... additional arguments passed to [ggbump::geom_bump]
#' Default = c(1, 1.15, 1.75, 2.35)
#'
#' @export

pvd_subtype_lineplot <- function(
    figs,
    events_to_highlight,
    min_alpha = 0.25,
    max_alpha = 1,
    stage_alpha = 1,
    facet_names = names(figs),
    facet_label_prefixes = NULL,
    facet_labels = compact_pvd_facet_labels(
      figs = figs,
      facet_label_prefix = facet_label_prefixes
    ) |>
      unlist(),
    text_size = 3.4,
    y_lab = "Sequential order",
    y_title_size = 9,
    y_text_size = 8,
    x_text_size = 8,
    subtype_x = c(1, 3, 5, 7),
    mult = .2,
    align_stage = TRUE,
    use_group_colors = FALSE,
    group_cols = group_colors(figs),
    legend_text_size = grid::unit(7, "pt"),
    ...) {



  dataset <- extract_lineplot_data(figs, facet_names)

  # truncate subtype_x to length(figs) - add check to force lengths to match?
  subtype_x <- subtype_x[seq_along(figs)]

  # additional processing
  plot_dataset <- dataset |>
    pvd_bumpplot_preprocessing(
      facet_names = facet_names,
      facet_labels = facet_labels,
      events_to_highlight = events_to_highlight,
      subtype_x = subtype_x
    ) |>
    pvd_bumpplot_preprocessing_2(
      min_alpha,
      max_alpha,
      stage_alpha
    )


  if (align_stage) {
    plot_dataset <- plot_dataset |>
      compute_bumpplot_y_positions()
  }

  # plot
  to_return <- plot_dataset |>
    ggplot() +
    aes(
      x = .data$facet_order,
      y = if (align_stage) .data$y else .data$Order,
      color = if (use_group_colors) .data$biomarker_group else .data$line_color
    ) +
    ggbump::geom_bump(
      data = plot_dataset |>
        dplyr::filter(
          .data$`event name` %in% c(events_to_highlight$event_name)
        ),
      aes(
        group = .data$`event name`
      ),
      ...
    ) +
    ggtext::geom_richtext(
      aes(
        label = .data$`event label`,
        fill = .data$background
      ),
      label.color = NA,
      label.padding = grid::unit(rep(0, 4), "pt"),
      size = text_size
    ) +
    scale_fill_identity() +
    scale_x_continuous(
      expand = expansion(mult = mult),
      breaks = subtype_x,
      labels = facet_labels
    ) +
    scale_y_reverse(
      expand = expansion(add = 1),
      breaks = NULL
    ) +
    labs(y = y_lab) +
    theme_classic() +
    theme(
      legend.position = "bottom",
      legend.text = element_text(size = legend_text_size),
      legend.title = element_text(size = legend_text_size),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(size = x_text_size)
    )

  if (use_group_colors) {
    to_return <- to_return +
      ggplot2::scale_color_manual(
        guide = ggh4x::guide_stringlegend(nrow = 1),
        name = "Symptom category:",
        values = group_cols
      )
  } else {
    to_return <- to_return +
      ggplot2::scale_color_identity(guide = "none")
  }

  return(to_return)
}
