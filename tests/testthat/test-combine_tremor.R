test_that("results are consistent", {

  skip_on_ci()
  skip_on_cran()

  result <-
    trax_gp34_all |>
    combine_tremor() |>
    select(
      sort(contains("tremor", ignore.case = TRUE)),
      -contains("kinesia", ignore.case = TRUE)
    ) |>
    distinct()

  result |>
    ssdtools:::expect_snapshot_data(name = "tremor-vars")
})
