test_that("results are consistent", {

  output_folder <-
    fs::path_package("extdata/sim_data/", package = "fxtas")

  results <-
    output_folder |>
    extract_results_from_pickle(output_folder = _,
                                n_s = 1,
                                use_rds = FALSE)

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
    biomarker_levels = biomarker_levels)

  plot1 |>
    vdiffr::expect_doppelganger(title = "plot1")
})
