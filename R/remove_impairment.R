collapse_impairment <- function(x) {
  x |>
    stringr::str_replace(" (i|I)mpairment", "")


}
