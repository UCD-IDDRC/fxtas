test_that(
  desc = "results are consistent",
  code = {

    skip_on_ci()

    output_path <-
      fs::path_package("extdata/sim_data", package = "fxtas")

    pickle_folder <- fs::path(output_path, "pickle_files")

    skip_if_not(dir.exists(pickle_folder))

    skip_if_not("fxtas39" %in% reticulate::conda_list()$name)

    reticulate::use_condaenv("fxtas39", required = TRUE) |>
      suppressWarnings()

    results =
      extract_results_from_pickle(
        output_folder = output_path,
        use_rds = FALSE
      )

    results$samples_sequence = NULL
    results$samples_f = NULL
    results |>
      expect_snapshot_value(style = "serialize")
  })
