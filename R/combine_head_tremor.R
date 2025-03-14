combine_head_tremor <- function(x, method = "new") {
  if (method == "old") {
    to_return <-
      x |>
      mutate(
        `head tremor` = pmax(
          .data$`head tremor hx`, .data$`head tremor exam`,
          na.rm = TRUE
        )
      )

  } else if (method == "new") {
    to_return <-
      x |>
      combine_history_and_exam("head tremor")
  } else {
    cli::cli_abort("method {method} not currently supported.")
  }
  return(to_return)
}
