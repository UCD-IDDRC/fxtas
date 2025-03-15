capitalize_label <- function(x) {
  if (is.null(x)) {
    NULL
  } else {
    stringr::str_replace(x, "([[:alpha:]])", toupper)
  }
}
