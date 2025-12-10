#' Plot estimated stage counts
#'
#' @param object a `SuStaIn_model` object
#' @inheritDotParams stage_barplot.default
#'
#' @returns a [ggplot2::ggplot]
#' @export
#' @example inst/examples/exm-stage_barplot.SuStaIn_model.R
stage_barplot.SuStaIn_model <- function(object, ...) {
  object$subtype_and_stage_table |>
    stage_barplot.default(xmax = object |> attr("n_events"), ...)
}
