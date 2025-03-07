#' Plot change in Stage ranking
#'
#' @param figs a [list] of todo
#' @param facet_labels todo
#' @param y_title_size todo
#' @param text_size todo
#' @param y_text_size todo
#' @param x_text_size todo
#' @param min_alpha todo
#' @param max_alpha todo
#' @param stage_alpha todo
#' @param y_lab todo
#'
#' @export
#' @example inst/examples/exm-pvd_lineplot.R
pvd_lineplot <- function(figs,
                         min_alpha = 0.25,
                         max_alpha = 1,
                         stage_alpha = 1,
                         facet_labels = names(figs),
                         text_size = 3.4,
                         y_lab = "Sequential order",
                         y_title_size = 9,
                         y_text_size = 8,
                         x_text_size = 8) {
  if (length(figs) == 1) {
    # extract data from pvd fig object
    dataset <- dplyr::bind_rows(figs[[1]]$data, .id = "facet")
  } else {
    # update list names
    names(figs) <- facet_labels
    # extract data from list of pvd fig object
    dataset <- dplyr::bind_rows(
      lapply(
        figs,
        function(x) {
          x$data
        }
      ),
      .id = "facet"
    ) |>
      dplyr::mutate(
        facet = .data$facet |> factor(levels = names(figs))
      )
  }

  # ---------------------------------------------------------------


  # ---------------------------------------------------------------


  # additional processing
  plot_dataset <- dataset |>
    dplyr::mutate(
      # extract order number
      Order =
        .data$`row number and name` |>
        stringi::stri_extract_first_regex("[0-9]+") |>
        as.integer(),
      # right justify left facet, left justify right facet
      hjust = ifelse(
        .data$facet == facet_labels[1],
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
      # logical: did sequence change
      Changed = n_distinct(.data$Order) != 1,
      # magnitude of sequence change
      Change = -base::diff(.data$Order),
      .by = "event name"
    ) |>
    dplyr::mutate(
      linesize = ifelse(
        .data$biomarker == "FXTAS Stage",
        1.5,
        1
      ),
      facet_order = case_when(
        facet == facet_labels[1] ~ 1,
        facet == facet_labels[2] ~ 1.15
      ),
      # colors of choice
      Change_color = dplyr::case_when(
        `biomarker` == "FXTAS Stage" ~ -2,
        Change < 0 ~ -1,
        Change == 0 ~ 0,
        Change > 0 ~ 1,
      ) |>
        factor(levels = c(-2, -1, 0, 1))
    )

  # alpha scaling #
  max_order <- max(plot_dataset$Order)
  alpha_mult <- ((max_alpha - min_alpha) / (max_order - 1))

  plot_dataset <- plot_dataset |>
    dplyr::mutate(
      alpha = dplyr::case_when(
        .data$biomarker == "FXTAS Stage" ~ stage_alpha,
        .default = (abs(.data$Change) * alpha_mult) + min_alpha
      )
    )

  facet_x_labels <- c(
    glue::glue('<p "style = text-align: right">{facet_labels[1]}</p>'),
    glue::glue('<p "style = text-align: left">{facet_labels[2]}</p>')
  )

  # plot
  ggplot(
    plot_dataset,
    aes(
      x = .data$facet_order,
      y = .data$Order |> factor()
    )
  ) +
    ggtext::geom_richtext(
      aes(
        label = .data$`event label`,
        hjust = .data$hjust
      ),
      fill = NA,
      label.color = NA,
      size = text_size
    ) +
    geom_line(
      aes(
        group = .data$`event name`,
        color = .data$Change_color
      ),
      linewidth = plot_dataset$linesize,
      alpha = plot_dataset$alpha
    ) +
    scale_x_continuous(
      limits = c(0.65, 1.5),
      breaks = c(1, 1.15),
      labels = facet_x_labels
    ) +
    scale_color_manual(
      drop = FALSE,
      values = c(
        "grey25",
        "#F8766D",
        "grey70",
        "#00BFC4")) +
    scale_y_discrete(limits = rev, breaks = NULL) +
    labs(y = y_lab) +
    theme_classic() +
    theme(
      legend.position = "none",
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggtext::element_markdown(size = y_title_size),
      axis.text.y = ggtext::element_markdown(size = y_text_size),
      axis.text.x = ggtext::element_markdown(
        size = x_text_size,
        hjust = plot_dataset[["hjust"]]
      )
    )
}
