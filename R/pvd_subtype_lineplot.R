#' @title Display Sequential Order of Events by Subtype
#' @param figs A [list] of todo
#' @param facet_labels todo
#' @param events_to_highlight todo
#' @param highlight_color todo
#' @param y_title_size todo
#' @param text_size todo
#' @param y_text_size todo
#' @param x_text_size todo
#' @param min_alpha todo
#' @param max_alpha todo
#' @param stage_alpha todo
#' @param y_lab todo
#' @param subtype_x Vector of x-axis value for the subtypes. Default = c(1, 1.15, 1.75, 2.35)
#'
#' @export

pvd_subtype_lineplot <- function(
    figs,
    events_to_highlight = NULL,
    highlight_color = NA,
    min_alpha = 0.25,
    max_alpha = 1,
    stage_alpha = 1,
    facet_labels = names(figs),
    text_size = 3.4,
    y_lab = "Sequential order",
    y_title_size = 9,
    y_text_size = 8,
    x_text_size = 8,
    subtype_x = c(1, 3, 5, 7)
) {
  dataset <- extract_lineplot_data(figs, facet_labels)
  fxtas_stages <- c("FXTAS Stage: 1",
                    "FXTAS Stage: 2",
                    "FXTAS Stage: 3",
                    "FXTAS Stage: 4",
                    "FXTAS Stage: 5")
  # additional processing
  plot_dataset <- dataset |>
    pvd_subtype_lineplot_preprocessing(
      facet_labels,
      events_to_highlight,
      highlight_color,
      subtype_x)

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
        replacement = padded_event,
        x = `event label`)
    )

  facet_x_labels <- c(
    glue::glue('<p "style = text-align: right">{facet_labels[1]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_labels[2]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_labels[3]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_labels[4]}</p>')
  )

  # get data for segments
  sub_data1 <- extract_lineplot_data(figs[1:2], facet_labels[1:2]) |>
    pvd_lineplot_preprocessing(
      facet_labels[1:2], events_to_highlight, highlight_color
    ) |>
    dplyr::mutate(
      # NEED TO FIX
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (0.5 * alpha_mult) + min_alpha
      )
    ) |>
    dplyr::mutate(Order = factor(Order)) |>
    tidyr::pivot_wider(
      id_cols = c(`event name`, linesize, alpha),
      names_from = facet,
      values_from = Order
    ) |>
    dplyr::mutate(
      x = mean(subtype_x[1:2]) - 0.1,
      xend = mean(subtype_x[1:2]) + 0.1
    ) |>
    # filter to only show lines for the highlighted events?
    dplyr::filter(
      `event name` %in% c(events_to_highlight, fxtas_stages)
    )


  sub_data2 <- extract_lineplot_data(figs[2:3], facet_labels[2:3]) |>
    pvd_lineplot_preprocessing(
      facet_labels[2:3], events_to_highlight, highlight_color
    ) |>
    dplyr::mutate(
      # NEED TO FIX
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (0.5 * alpha_mult) + min_alpha
      )
    ) |>
    dplyr::mutate(Order = factor(Order)) |>
    tidyr::pivot_wider(
      id_cols = c(`event name`, linesize, alpha),
      names_from = facet,
      values_from = Order
    ) |>
    dplyr::mutate(
      x = mean(subtype_x[2:3]) - 0.1,
      xend = mean(subtype_x[2:3]) + 0.1
    ) |>
    # filter to only show lines for the highlighted events?
    dplyr::filter(
      `event name` %in% c(events_to_highlight, fxtas_stages)
    )

  sub_data3 <- extract_lineplot_data(figs[3:4], facet_labels[3:4]) |>
    pvd_lineplot_preprocessing(
      facet_labels[3:4], events_to_highlight, highlight_color
    ) |>
    dplyr::mutate(
      # NEED TO FIX
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (0.5 * alpha_mult) + min_alpha
      )
    ) |>
    dplyr::mutate(Order = factor(Order)) |>
    tidyr::pivot_wider(
      id_cols = c(`event name`, linesize, alpha),
      names_from = facet,
      values_from = Order
    ) |>
    dplyr::mutate(
      x = mean(subtype_x[3:4]) - 0.1,
      xend = mean(subtype_x[3:4]) + 0.1
    ) |>
    # filter to only show lines for the highlighted events?
    dplyr::filter(
      `event name` %in% c(events_to_highlight, fxtas_stages)
    )


  # plot
  plot_dataset |>
    ggplot() +
    aes(
      x = .data$facet_order,
      y = .data$Order |> factor()
    ) +
    ggtext::geom_richtext(
      aes(
        label = .data$padded_label,
        # hjust = .data$hjust,
        fill = .data$background
      ),
      label.color = NA,
      label.padding = grid::unit(rep(1, 4), "pt"),
      size = text_size
    ) +
    scale_fill_identity() +
    # segment from group 1 to 2
    geom_segment(
      data = sub_data1,
      aes(
        x = x,
        xend = xend,
        y = `Group 1`,
        yend = `Group 2`
      ),
      # arrow = grid::arrow(
      #   angle = 10,
      #   length = unit(5, "points"),
      #   type = "closed",
      #   ends = "both"
      # ),
      linewidth = sub_data1$linesize,
      alpha = sub_data1$alpha
    ) +
    # segment from group 2 to 3
    geom_segment(
      data = sub_data2,
      aes(
        x = x,
        xend = xend,
        y = `Group 2`,
        yend = `Group 3`
      ),
      # arrow = grid::arrow(
      #   angle = 10,
      #   length = unit(5, "points"),
      #   type = "closed",
      #   ends = "both"
      # ),
      linewidth = sub_data2$linesize,
      alpha = sub_data3$alpha
    ) +
    # segment from group 3 to 4
    geom_segment(
      data = sub_data3,
      aes(
        x = x,
        xend = xend,
        y = `Group 3`,
        yend = `Group 4`
      ),
      # arrow = grid::arrow(
      #   angle = 10,
      #   length = unit(5, "points"),
      #   type = "closed",
      #   ends = "both"
      # ),
      linewidth = sub_data3$linesize,
      alpha = sub_data3$alpha
    ) +
    scale_x_continuous(
      expand = expansion(add = 1),
      breaks = subtype_x,
      labels = facet_x_labels
    ) +
    scale_y_discrete(limits = rev, breaks = NULL) +
    labs(y = y_lab) +
    theme_classic() +
    theme(
      legend.position = "none",
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(size = x_text_size)
    )
}


# helpers
pvd_subtype_lineplot_preprocessing <- function(
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
        false = NA
      )
    )
}
