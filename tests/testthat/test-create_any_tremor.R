test_that(
  desc = "composite variable matches the individual tremor variables",
  code = {
    withr::local_package("dplyr")
    tremor_types <- c(
      "Hx Intention tremor",
      "Exam Intention tremor",
      "Hx Resting tremor",
      "Exam Resting tremor",
      "Hx Postural tremor",
      "Exam Postural tremor",
      "Intermittent tremor"
    )

    tremor_data <- testthat::test_path("fixtures", "tremor_data.rds") |>
      readr::read_rds()

    inconsistent <-
      tremor_data |>
      create_any_tremor() |>
      dplyr::filter(`Any tremor (excluding head)` %in%
                      "No tremors recorded",
                    if_all(all_of(tremor_types), is.na)) |>
      dplyr::select(any_of(c(
        "FXS ID",
        "Event Name",
        "Visit Date",
        tremor_types, "Any tremor (excluding head)"
      )))

    expect_equal(object = nrow(inconsistent), expected = 0)
  }
)
