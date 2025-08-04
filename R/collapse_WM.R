collapse_WM <- function(x) {
  x |>
    stringr::str_replace("White Matter", "WM")

}
