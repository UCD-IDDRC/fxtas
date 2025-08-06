expand_SWM <- function(x) {
  x |>
    stringr::str_replace("^SWM ", "Spatial Working Memory (SWM): ")
}
