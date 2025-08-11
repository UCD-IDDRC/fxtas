collapse_parentheticals <- function(x) {
  x |>
    stringr::str_replace(" \\(.*\\) ?", "")

}
