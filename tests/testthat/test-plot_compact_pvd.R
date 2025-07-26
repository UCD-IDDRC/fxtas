test_that("`plot_compact_pvd()` produces consistent results", {
  fig1 <-
    fs::path_package("extdata/sim_data/", package = "fxtas") |>
    extract_figs_from_pickle(output_folder = _,
                             n_s = 3,
                             use_rds = FALSE) |>
    plot_compact_pvd(scale_colors = c("red", "blue", "purple4"),
                     facet_label_prefix = NULL)

  fig1 |> vdiffr::expect_doppelganger(title = "pvd")


})
