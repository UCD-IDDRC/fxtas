replace_missing_with_no <- function(x) {
  dplyr::if_else(
    condition = x %in% c(777, 888, 999),
    true = "No",
    false = x
  )
}
