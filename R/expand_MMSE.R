expand_MMSE <- function(x) {
  x |>
    stringr::str_replace("^MMSE ", "Mini-Mental State Examination (MMSE): ")
}
