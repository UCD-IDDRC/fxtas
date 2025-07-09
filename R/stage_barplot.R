#' Plot estimated stage counts
#'
#' @param object an object,
#' whose class will determine which `stage_barplot()` method is used
#' @param ... other arguments passed to specific methods
#'
#' @returns a [ggplot2::ggplot]
#' @export
#'
stage_barplot <- function(object, ...) {
  UseMethod("stage_barplot")
}

#' Plot estimated stage counts
#'
#' @param object a `subtype_and_stage_table` object
#' (a type of data.frame)
#' @param xmax largest x-value to display
#' @param ... unused
#' @param include_type_0 [logical] whether to include Type 0 in the plot
#'
#' @returns a [ggplot2::ggplot]
#' @export
#' @examples sim_subtype_and_stage_table |> stage_barplot()
stage_barplot.default <- function(
    object,
    include_type_0 = TRUE,
    xmax = max(object$ml_stage, na.rm = TRUE),
    ...) {

  multiple_subtypes <-
    "Type 2" %in% object$ml_subtype

  if (multiple_subtypes && !include_type_0) {
    object <-
      object |>
      dplyr::filter(.data$ml_subtype != "Type 0") |>
      dplyr::mutate(
        ml_subtype = .data$ml_subtype |> droplevels()
      )
  }

  plot1 <-
    object |>
    ggplot2::ggplot() +
    ggplot2::aes(x = .data$ml_stage) +
    geom_bar() +
    xlab("Disease stage") +
    ylab("Number of observations in stage") +
    ggplot2::geom_hline(
      aes(
        yintercept = 3,
        col = "recommended sample size: three observations per stage"
      )
    ) +
    theme_bw() +
    ggplot2::expand_limits(x = xmax) +
    theme(legend.position = "bottom") +
    labs(color = "")

  if (multiple_subtypes) {
    plot1 <- plot1 + ggplot2::facet_wrap(~ ml_subtype)
  }

  return(plot1)
}

#' Plot estimated stage counts
#'
#' @param object a [list] of `Sustain_model` objects
#' @inheritDotParams stage_barplot.default
#' @returns a [ggplot2::ggplot]
#' @export
#'
stage_barplot.list <- function(object, ...) {
  object |>
    lapply(
      FUN = function(x) purrr::pluck(x, "subtype_and_stage_table")
    ) |>
    dplyr::bind_rows(.id = "stratum") |>
    stage_barplot.default() +
    facet_wrap(~ stratum)
}
