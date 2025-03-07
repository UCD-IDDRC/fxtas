count_articles <- function(x) {
  x |>
    count(across(all_of("Journal")), sort = TRUE)
}
