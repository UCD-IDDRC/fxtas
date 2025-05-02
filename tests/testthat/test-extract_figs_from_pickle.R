test_that("`extract_figs_from_pickle()` produces stable results", {

  reticulate::py_discover_config(required_module = "pySuStaIn")$required_module_path |>
    is.null() |>
    skip_if()

  fs::path_package("extdata/sim_data/", package = "fxtas") |>
    extract_figs_from_pickle(output_folder = _,
                             n_s = 1,
                             use_rds = TRUE) |>
    ggplot2::ggsave(
      filename = tempfile(),
      device = "svg",
      width = 10,
      height = 10
    ) |>
    expect_snapshot_file(name = "PVD.svg")
})
