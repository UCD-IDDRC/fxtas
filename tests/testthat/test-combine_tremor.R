test_that("results are consistent", {

  skip_on_ci()
  skip_on_cran()

  result <-
    trax_gp34_all |>
    combine_tremor() |>
    select(
      contains("tremor", ignore.case = TRUE),
      -contains("kinesia", ignore.case = TRUE),
      -contains("missingness")
    ) |>
    distinct() |>
    relocate(sort(tidyselect::peek_vars()))

  result |>
    ssdtools:::expect_snapshot_data(name = "tremor-vars")
})
