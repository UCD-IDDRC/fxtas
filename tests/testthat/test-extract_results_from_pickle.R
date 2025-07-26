test_that(
  desc = "results are consistent",
  code = {

    skip_on_ci()

    output_path <-
      fs::path_package("extdata/sim_data", package = "fxtas")

    pickle_folder <- fs::path(output_path, "pickle_files")

    skip_if_not(dir.exists(pickle_folder))

    skip_if_not("fxtas39" %in% reticulate::conda_list()$name)

    reticulate::py_require(
      packages = c(
        "git+https://github.com/ucl-pond/kde_ebm",
        "git+https://github.com/d-morrison/pySuStaIn"
      ),
      python_version = "3.9"
    )

    results =
      extract_results_from_pickle(
        output_folder = output_path,
        use_rds = FALSE
      )

    results$samples_sequence = NULL
    results$samples_f = NULL

    results |>
      dplyr::glimpse() |>
      expect_snapshot()

    results |>
      expect_snapshot_value(style = "serialize")

  })
