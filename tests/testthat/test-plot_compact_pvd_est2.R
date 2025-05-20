test_that("results are consistent", {

  figs <- extract_figs_from_pickle(
    n_s = 4,
    dataset_name = "sample_data",
    output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
    use_rds = TRUE
  )

  fig <- plot_compact_pvd_est2(
    figs = figs,
    tile_height = 1,
    y_text_size = 6,
    title_size = 8
  )
  fig |>
    vdiffr::expect_doppelganger(title = "sim-data")

})
