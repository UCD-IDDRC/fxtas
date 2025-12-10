#' @export
#' @importFrom labelled var_label
labelled::var_label

#' Extract variable labels from a list object
#'
#' @param x a [list]
#' @param ... not used
#' @returns a named [character] [vector]
#' @example inst/examples/exm-var_label.list.R
#'
#' @export
var_label.list <- function(x, ...) {

  has_var_labels <- !is.null(x[[1]] |> attr("label"))

  if (has_var_labels) {
    x |>
      purrr::map_chr(.f = labelled::get_variable_labels)
  } else {
    names(x)
  }
}
