#' Extract biomarker event names
#' @param object an object
#' @param ... additional arguments passed to class-specific methods
#' @returns a [character] [vector]
#' @export
#'
get_biomarker_event_names <- function(object, ...) {
  UseMethod("get_biomarker_event_names")
}

#' @export
get_biomarker_event_names.levels_list <- function(
    object,
    ...) {

  object |>
    get_biomarker_events_table() |>
    get_biomarker_event_names()

}

#' @export
get_biomarker_event_names.biomarker_events_table <- function(
    object, ...) {
  object |> dplyr::pull("level_labelled")
}
