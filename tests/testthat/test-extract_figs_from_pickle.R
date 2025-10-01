test_that("`extract_figs_from_pickle()` produces stable results", {

  skip_on_ci()
  reticulate::use_condaenv("fxtas39", required = TRUE,
                           conda = "auto")
  reticulate::py_require(
    packages = c(
      "git+https://github.com/ucl-pond/kde_ebm",
      "git+https://github.com/d-morrison/pySuStaIn"
    ),
    python_version = "3.9"
  )

  no_pysustain <- reticulate::py_discover_config(
    required_module = "pySuStaIn"
  )$required_module_path |>
    is.null()

  testthat::announce_snapshot_file("pvd.svg")
  skip_if(no_pysustain)

  fs::path_package("extdata/sim_data/", package = "fxtas") |>
    extract_figs_from_pickle(output_folder = _,
                             n_s = 1,
                             use_rds = TRUE) |>
    vdiffr::expect_doppelganger(title = "pvd")
})
