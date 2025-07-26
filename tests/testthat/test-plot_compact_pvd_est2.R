test_that("results are consistent", {

  # generate from make-sim_figs_4.R:
  figs  <-
    readr::read_rds(
      testthat::test_path("fixtures", "sim-figs-4.rds")
    )

  fig <- plot_compact_pvd_est2(
    facet_label_prefix = rep("", 4),
    show_uncert = FALSE,
    figs = figs,
    tile_height = 1,
    y_text_size = 6,
    title_size = 8
  )
  fig |>
    vdiffr::expect_doppelganger(title = "sim-data")

})
