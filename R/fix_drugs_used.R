fix_drugs_used <- function(dataset)
{
  dataset |>
    dplyr::mutate(
      `Drugs used` =
        .data$`Drugs used` |>
        factor(levels = sort(unique(.data$`Drugs used`)))
    )
}
