test_that("`extract_figs_from_pickle()` produces stable results", {

  fs::path_package("extdata/sim_data/", package = "fxtas") |>
    extract_figs_from_pickle(output_folder = _,
                             n_s = 1,
                             use_rds = TRUE) |>
    vdiffr::expect_doppelganger(title = "PVD")
})
