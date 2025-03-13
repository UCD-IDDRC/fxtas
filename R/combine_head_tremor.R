combine_head_tremor <- function(x, method = "old") {
  if (method == "old") {
    to_return <-
      x |>
      mutate(
        `head tremor` = pmax(
          .data$`head tremor hx`, .data$`head tremor exam`,
          na.rm = TRUE
        )
      )

  } else {
    to_return <-
      x |>
      rowwise() |>
      mutate(
        `head tremor` =
          do.call(pmax, across(any_of(c("head tremor hx", "head tremor exam"))))
      ) |>
      ungroup()
  }
  return(to_return)
}
