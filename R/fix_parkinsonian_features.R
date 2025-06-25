fix_parkinsonian_features <- function(data) {

  data <- data |>
    mutate(
      # there's no `pill-rolling tremor history` variable
      `pill-rolling tremor` = .data$`pill-rolling tremor exam`
    )

  pfs <- c("Stiff gait", "Masked faces", "Increased tone", "pill-rolling tremor")
  # data <- data |>
  #   mutate(
  #     pf2 =
  #       if_else(
  #         .data$`parkinsonian features` == "Yes" |
  #           if_any(all_of(pfs), .fns = ~.x == "Yes"),
  #         "Yes",
  #         "No")
  #
  #
  #   )

  return(data)
}
