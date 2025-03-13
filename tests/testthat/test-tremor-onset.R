test_that(
  "`tremor: age of onset: missingness reasons` matches `tremor: age of onset`",

  {

    skip_if_not(exists("gp34"))

    inconsistent =
      gp34 |>
      dplyr::filter(
        is.na(`tremor: age of onset`),
        `tremor: age of onset: missingness reasons` == "[Valid data recorded]") |>
      dplyr::select(
        `tremor: age of onset`,
        `tremor: age of onset: missingness reasons`)

    expect_equal(object = nrow(inconsistent), expected = 0)


  })
