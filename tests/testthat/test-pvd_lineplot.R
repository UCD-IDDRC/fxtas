test_that("results are consistent", {
  output_path =
    fs::path_package("extdata/sim_data", package = "fxtas")

  figs = extract_figs_from_pickle(
    output_folder = output_path,
    n = 3)

  figs[1:2] |>
    pvd_lineplot() |>
    vdiffr::expect_doppelganger(title = "sim-data-1-2")

})

test_that("results are consistent with real data", {
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"
  figs <-
    readr::read_rds(
      testthat::test_path("fixtures", "fxtas-figs4.rds")
    )

  figs[1:2] |>
    pvd_lineplot() |>
    vdiffr::expect_doppelganger(title = "fxtas-data-1-2")

})
