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


test_that(
  desc = "`plot_compact_pvd()` produces consistent results with fxtas results",
  code = {

    pvd_list_by_sex <-
      readr::read_rds(
        testthat::test_path("fixtures", "pvd_list_by_sex.rds")
      )

    fig2 <-
      pvd_list_by_sex |>
      plot_compact_pvd()

    fig2 |> vdiffr::expect_doppelganger(title = "pvd-fxtas-by-sex")


  }
)
