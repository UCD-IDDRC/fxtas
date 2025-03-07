## Tremor variables have TWO versions: "ne_tremor" and "neu_tremor"
##  ne = Neurological Exam, neu = Neurological History
##  create a new Tremor variable that takes the more severe score (e.g. Yes)

combine_tremor <- function(
    dataset,
    tremor_vars = c(
      "Hx Intention tremor",
      "Hx Resting tremor",
      "Hx Postural tremor",
      "Exam Intention tremor",
      "Exam Resting tremor",
      "Exam Postural tremor",
      "Hx Head tremor",
      "Exam Head tremor"
    )) {
  dataset |>
    dplyr::mutate(
      # convert to ordered factor
      dplyr::across(
        .cols = dplyr::all_of(tremor_vars),
        ~ factor(.x, levels = c("No", "Yes"), ordered = TRUE)
      ),
      # combine using most severe score
      `Resting tremor` = pmax(
        .data$`Hx Resting tremor`, .data$`Exam Resting tremor`,
        na.rm = TRUE
      ),
      `Postural tremor` = pmax(
        .data$`Hx Postural tremor`, .data$`Exam Postural tremor`,
        na.rm = TRUE
      ),
      `Intention tremor` = pmax(
        .data$`Hx Intention tremor`, .data$`Exam Intention tremor`,
        na.rm = TRUE
      ),
      `Head tremor` = pmax(
        .data$`Hx Head tremor`, .data$`Exam Head tremor`,
        na.rm = TRUE
      )
    )
}
