#' @title Display Sequential Order of Events by Subtype
#' @param figs A [list] of todo
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
#' @param use_group_color [logical]: whether to use existing group colors
#' or custom line colors from `events_to_highlight` argument
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
    facet_label_prefixes = names(figs),
    text_size = 3.4,
    y_lab = "Sequential order",
    y_title_size = 9,
    y_text_size = 8,
    x_text_size = 8,
    subtype_x = c(1, 3, 5, 7),
    mult = .2,
    align_stage = TRUE,
    use_group_colors = FALSE,
    ...) {

  dataset <- extract_lineplot_data(figs, facet_names)
  fxtas_stages <- c("FXTAS Stage: 1",
                    "FXTAS Stage: 2",
                    "FXTAS Stage: 3",
                    "FXTAS Stage: 4",
                    "FXTAS Stage: 5")

  # truncate subtype_x to length(figs) - add check to force lengths to match?
  subtype_x = subtype_x[1:length(figs)]

  facet_labels <- compact_pvd_facet_labels(
    figs = figs,
    facet_label_prefix = facet_label_prefixes
  ) |>
    unlist()

  # additional processing
  plot_dataset <- dataset |>
    pvd_bumpplot_preprocessing(
      facet_names = facet_names,
      facet_labels = facet_labels,
      events_to_highlight = events_to_highlight,
      subtype_x = subtype_x
    )

  # alpha scaling #
  alpha_mult <- calc_alpha_mult(plot_dataset, max_alpha, min_alpha)

  tmp_labels <- gsub("<i.+'>", "", plot_dataset$`event label`) |>
    gsub(pattern = "</i>", replacement = "", x = _) |>
    gsub(pattern = "<b>", replacement = "", x = _) |>
    gsub(pattern = "</b>", replacement = "", x = _)

  max_event_length <- tmp_labels |>
    nchar() |>
    max()

  even_length <- ceiling(max_event_length / 2) * 2

  plot_dataset <- plot_dataset |>
    dplyr::mutate(
      # NEED TO FIX
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (0.5 * alpha_mult) + min_alpha
      ),
      # force string to be same length?
      padded_event = stringr::str_pad(
        tmp_labels,
        width = even_length,
        side = "both"
      ) |> factor()
    ) |>
    dplyr::mutate(
      # apply to label?
      padded_label = mapply(
        gsub,
        pattern = tmp_labels,
        replacement = .data$padded_event,
        x = .data$`event label`
      ),
      # color = group_color
      # color = if_else(
      #   .data$biomarker == "FXTAS Stage",
      #   "black",
      #   "green"
      # )
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
      y = if (align_stage) .data$y else .data$Order
    ) +
    ggbump::geom_bump(
      data = plot_dataset |>
        dplyr::filter(
          .data$`event name` %in% c(events_to_highlight$event_name)
        ),
      aes(
        color = if (use_group_colors) .data$group_color else .data$line_color,
        group = .data$`event name`),
      ...
    ) +
    ggtext::geom_richtext(
      aes(
        label = .data$padded_label,
        # hjust = .data$hjust,
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
      legend.position = "none",
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(size = x_text_size)
    ) +
    scale_color_identity()

  return(to_return)
}
