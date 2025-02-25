#' Title
#'
#' @param object
#' @param ...
#'
#' @returns
#' @export
#'
stage_barplot <- function(object, ...) {
  UseMethod("stage_barplot")
}

#' Title
#'
#' @param object
#' @param ...
#'
#' @returns
#' @export
#'
stage_barplot.Sustain_model = function(object, ...) {
  results$subtype_and_stage_table |>
    stage_barplot.default(...)
}

#' Title
#'
#' @param object
#' @param ... unused
#' @param include_type_0
#'
#' @returns
#' @export
stage_barplot.default = function(object,
                                 include_type_0 = TRUE,
                                 ...) {

  multiple_subtypes <-
    "Type 2" %in% object$ml_subtype

  if (multiple_subtypes && !include_type_0) {
    object <-
      object |>
      dplyr::filter(.data$ml_subtype != "Type 0") |>
      dplyr::mutate(ml_subtype =
                      .data$ml_subtype |> droplevels())
  }

  plot1 <-
    object |>
    ggplot2::ggplot() +
    ggplot2::aes(x = ml_stage) +
    geom_bar() +
    xlab("Disease stage") +
    ylab("Number of observations in stage")

  if (multiple_subtypes) {
    plot1 <- plot1 + ggplot2::facet_wrap(~ ml_subtype)
  }

  return(plot1)
}

#' Title
#'
#' @param results_list
#'
#' @returns
#' @export
#'
stage_barplot.list <- function(object) {
  object |>
    lapply(
      F = function(x) purrr::pluck(x, "subtype_and_stage_table")
    ) |>
    dplyr::bind_rows(.id = "stratum") |>
    stage_barplot.default() +
    facet_wrap(~ stratum)
}
