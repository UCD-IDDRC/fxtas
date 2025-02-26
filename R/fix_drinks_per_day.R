fix_drinks_per_day <- function(dataset) {

  dataset |>
    dplyr::mutate(

      `# of drinks per day now` =
        if_else(
          .data$`# of drinks per day now` == -2,
          0,
          .data$`# of drinks per day now`
        ),

      `# of drinks per day now` =
        if_else(
          .data$Study == "GP3" &
            is.na(.data$`# of drinks per day now` |> clean_numeric()) &
            .data$`Alcohol use/abuse` %in% c("Past Only", "None"),
          0,
          .data$`# of drinks per day now`
        ),

      `# of drinks per day now: missingness reasons` =
        missingness_reasons.numeric(.data$`# of drinks per day now`),

      `# of drinks per day now` =
        .data$`# of drinks per day now` |>
        clean_numeric(),


    )
}
