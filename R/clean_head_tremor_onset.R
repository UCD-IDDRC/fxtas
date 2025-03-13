clean_head_tremor_onset <- function(dataset)
{
  dataset |>
    dplyr::mutate(

      `head tremor: age of onset` =
        .data$`head tremor: age of onset` |> dplyr::recode("68-67" = "67.5"),
      # "68-67" |> strsplit("-") |> sapply(FUN = function(x) median(as.numeric(x)))
    )
}
