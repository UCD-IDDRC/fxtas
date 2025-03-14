replace_missing_with_0 <- function(x) {
  dplyr::if_else(
    condition = x %in% c(777, 888, 999),
    true = 0,
    false = x
  )
}
