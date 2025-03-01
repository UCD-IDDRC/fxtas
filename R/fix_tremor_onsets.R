fix_tremor_onsets <- function(dataset)
{
  dataset |>
    dplyr::mutate(
      `Tremor: Age of onset` =

      # after discussion with Kyoungmi and Matt, 2023/08/01:
        if_else(
          (.data$`Tremor: Age of onset` == 0) &
            (.data$`Any tremor (excluding head)` == "No tremors recorded"),
          NA_real_,
          .data$`Tremor: Age of onset`
        )

    )
}
