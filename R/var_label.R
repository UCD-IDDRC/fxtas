#' @export
#' @importFrom labelled var_label
labelled::var_label

#' Extract variable labels from a list object
#'
#' @param object a [list]
#' @param ... not used
#' @returns a named [character] [vector]
#' @example inst/examples/exm-var_label.list.R
#'
#' @export
var_label.list <- function(object, ...) {

  has_var_labels <- !is.null(object[[1]] |> attr("label"))

  if (has_var_labels) {
    object |>
      purrr::map_chr(.f = labelled::get_variable_labels)
  } else {
    names(object)
  }
}
