simulated_fisher <- function(data, variable, by, ...) {
  data <- data[c(variable, by)]
  stats::fisher.test(
    data[[variable]], as.factor(data[[by]]), simulate.p.value = TRUE, B = 10000,
    conf.level = 0.95
  ) |>
    broom::tidy()
}
