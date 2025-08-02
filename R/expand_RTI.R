expand_RTI <- function(x) {
  x |>
    stringr::str_replace("^RTI ", "Reaction Time (RTI): ")
}
