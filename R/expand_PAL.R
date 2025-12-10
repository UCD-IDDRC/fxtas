expand_PAL <- function(x) {
  x |>
    stringr::str_replace("^PAL ", "Paired Associates Learning (PAL): ")
}
