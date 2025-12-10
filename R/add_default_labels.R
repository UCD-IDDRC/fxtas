#' @title Add default variable labels
#'
#' @param data a [data.frame]
#'
#' @returns a modified version of `data`
#' @export
#'
#' @examples
#' iris |>
#'   add_default_labels() |>
#'   labelled::var_label(unlist = TRUE)
add_default_labels <- function(data) {
  data |>
    set_variable_labels(
      .labels = get_variable_labels(data, null_action = "fill", unlist = TRUE)
    )
}
