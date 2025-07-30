get_var_labels1 <- function(object) {

  has_var_labels <- !is.null(object[[1]] |> attr('label'))

  if (has_var_labels) {
    object |>
      purrr::map_chr(.f = labelled::get_variable_labels)
  } else {
    names(object)
  }
}
