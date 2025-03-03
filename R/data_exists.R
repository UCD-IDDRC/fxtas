data_exists <- function(name) {
  paste0(name, ".rda") %in% dir("data/")
}
