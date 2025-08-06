#' Extract variable labels from list
#'
#' @param object a [list]
#' @param ... unused
#'
#' @returns a [vector] of [character] strings corresponding to `object`
#' @export
#'
labels.list <- function(object, ...) {
  to_return <-
    object |>
    sapply(F = labelled::get_variable_labels) |>
    unlist()
}
