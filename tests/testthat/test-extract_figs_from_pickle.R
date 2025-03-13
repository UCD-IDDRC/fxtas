test_that("`extract_figs_from_pickle()` produces stable results", {

  skip_on_os("windows")
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
