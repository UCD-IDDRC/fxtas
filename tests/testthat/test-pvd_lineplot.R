test_that("results are consistent", {
  output_path =
    fs::path_package("extdata/sim_data", package = "fxtas")

  figs = extract_figs_from_pickle(
    output_folder = output_path,
    use_rds = TRUE,
    n = 3
  )

  figs[1:2] |>
    pvd_lineplot(group_cols = figs |> group_colors()) |>
    vdiffr::expect_doppelganger(title = "sim-data-1-2")

})

test_that("results are consistent with real data", {
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"
  figs <-
    readr::read_rds(
      testthat::test_path("fixtures", "fxtas-figs4.rds")
    )

  plot1 <- figs[1:2] |>
    pvd_lineplot(group_cols = figs |> group_colors())

  plot1 |>
    vdiffr::expect_doppelganger(title = "fxtas-data-1-2")

})
