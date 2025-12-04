test_that(
  desc = "results are consistent",
  code = {

    output_folder <-
      fs::path_package("extdata/sim_data/", package = "fxtas")

    results <-
      output_folder |>
      extract_results_from_pickle(
        output_folder = _,
        n_s = 1,
        use_rds = TRUE
      )

    plot1 <-
      plot_positional_var(results = results)

    plot1 |>
      vdiffr::expect_doppelganger(title = "plot1")
  }
)


test_that("results are consistent with three groups", {

  output_folder <-
    fs::path_package("extdata/sim_data/", package = "fxtas")

  results <-
    output_folder |>
    extract_results_from_pickle(
      output_folder = _,
      n_s = 3,
      use_rds = TRUE
    )

  biomarker_groups =
    output_folder |>
    fs::path("biomarker_groups.rds") |>
    readr::read_rds()

  biomarker_levels =
    output_folder |>
    fs::path("biomarker_levels.rds") |>
    readr::read_rds()

  plot1 <-
    plot_positional_var(
      results = results,
      biomarker_groups = biomarker_groups,
      biomarker_levels = biomarker_levels
    )

  plot1[[1]] |>
    vdiffr::expect_doppelganger(title = "plot3.1")
})

test_that(
  desc = "results are consistent with fxtas results",
  code = {

    results <-
      testthat::test_path("fixtures", "fxtas_results_overall.rds") |>
      readr::read_rds()

    plot1 <- results |> plot_positional_var(use_labels = FALSE)

    plot1 |>
      vdiffr::expect_doppelganger(title = "plot1-fxtas")

    plot1 <- results |> plot_positional_var(use_labels = TRUE)

    plot1 |>
      vdiffr::expect_doppelganger(title = "plot1-fxtas-labelled")
  }
)
