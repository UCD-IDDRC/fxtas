tremor_types <- c(
  "Hx Intention tremor",
  "Exam Intention tremor",
  "Hx Resting tremor",
  "Exam Resting tremor",
  "Hx Postural tremor",
  "Exam Postural tremor",
  "Intermittent tremor"
)

tremor_data <-
  trax_gp34_all |>
  dplyr::select(
    dplyr::contains("tremor") & !dplyr::contains("onset")
  ) |>
  dplyr::distinct()

tremor_data |>
  readr::write_rds("tests/testthat/fixtures/tremor_data.rds")
