collapse_five <- function(x) {
  x |>
    stringr::str_replace("(F|f)ive", "5")


}
