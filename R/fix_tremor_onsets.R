fix_tremor_onsets <- function(dataset)
{
  dataset |>
    dplyr::mutate(
      `tremor: age of onset` =

      # after discussion with Kyoungmi and Matt, 2023/08/01:
        if_else(
          (.data$`tremor: age of onset` == 0) &
            (.data$`any tremor (excluding head)` == "No tremors recorded"),
          NA_real_,
          .data$`tremor: age of onset`
        )

    )
}
