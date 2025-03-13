test_that("results are consistent", {

  skip_on_ci()
  skip_on_cran()

  skip_if_not(exists("trax_gp34_all"))
  result <-
    trax_gp34_all |>
    select(
      contains("tremor", ignore.case = TRUE),
      -contains("kinesia", ignore.case = TRUE),
      -contains("missingness"),
      -contains("age of onset")
    ) |>
    distinct() |>
    arrange() |>
    combine_tremor() |>
    relocate(sort(tidyselect::peek_vars()))

  result |>
    ssdtools:::expect_snapshot_data(name = "tremor-vars")
})
