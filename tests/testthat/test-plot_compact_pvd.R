test_that("`plot_compact_pvd()` produces consistent results", {

  fig0 <-
    readr::read_rds(
      testthat::test_path("fixtures", "sim-figs-3.rds")
    )
  fig1 <- fig0 |>
    plot_compact_pvd(scale_colors = c("red", "blue", "purple4"),
                     legend.position = "none",
                     rel_heights = c(1, 0.1),
                     facet_label_prefix = NULL)

  fig1 |>
    vdiffr::expect_doppelganger(
      title = "pvd",
      variant = system_os()
    )


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
      plot_compact_pvd(
        legend.position = "none",
        rel_heights = c(1, 0.1)
      )

    fig2 |> vdiffr::expect_doppelganger(
      title = "pvd-fxtas-by-sex",
      variant = system_os()
    )

    fig3 <-
      pvd_list_by_sex |>
      plot_compact_pvd(
        legend.position = "right",
        legend.direction = "vertical"
      )

    fig3 |> vdiffr::expect_doppelganger(
      variant = system_os(),
      title = "pvd-fxtas-by-sex-with-legend"
    )

    fig4 <-
      pvd_list_by_sex |>
      plot_compact_pvd(
        legend.position = "right",
        legend.direction = "vertical",
        colorbar_label_type = "subscript"

      )

    fig4 |> vdiffr::expect_doppelganger(
      variant = system_os(),
      title = "pvd-fxtas-by-sex-with-legend-subscript"
    )

  }
)
