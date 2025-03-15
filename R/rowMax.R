# notes: could use `do.call()`, `invoke()`, `rowwise() & max()`;
# no clearly most-idiomatic approach as of 2024-03-22
# some discussion here:
# https://r4ds.hadley.nz/numbers.html#numeric-transformations

rowMax.default <- function(x) {
  do.call(what = pmax, args = c(x, na.rm = TRUE))
  # apply(F = max, MARGIN = 1, na.rm = TRUE) # doesn't work with all NAs # nolint: commented_code_linter
}

rowMax <- function(x) {
  UseMethod("rowMax")
}

rowMax.character <- function(x) {
  rowMax(across(all_of(x)))
}
