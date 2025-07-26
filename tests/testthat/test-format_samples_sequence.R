test_that("results are consistent", {
  output_folder <-
    fs::path_package("extdata/sim_data/", package = "fxtas")

  results <-
    output_folder |>
    extract_results_from_pickle(output_folder = _,
                                n_s = 3,
                                use_rds = FALSE,
                                format_results = FALSE)

  biomarker_levels =
    output_folder |>
    fs::path("biomarker_levels.rds") |>
    readr::read_rds()

  samples_seq_formatted <- format_samples_sequence(
    results = results,
    biomarker_levels = biomarker_levels,
    n_s = get_n_subtypes(results)
  )
  samples_seq_formatted[,,1] |> t() |> as.data.frame() |>
    ssdtools:::expect_snapshot_data(name = "sim-data")
})
