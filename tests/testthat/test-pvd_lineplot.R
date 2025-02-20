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
