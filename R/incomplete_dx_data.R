incomplete_dx_data <- function(x) {
  cumsum(x %in% "Yes") > 0 &
    !(x %in% "Yes")
}
