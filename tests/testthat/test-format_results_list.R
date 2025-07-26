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

    biomarker_levels <-
      output_path |>
      fs::path("biomarker_levels.rds") |>
      readr::read_rds()

    biomarker_groups <-
      output_path |>
      fs::path("biomarker_groups.rds") |>
      readr::read_rds()

    results0 <-
      extract_results_from_pickle(
        output_folder = output_path,
        use_rds = FALSE,
        format_results = FALSE,
        n_s = 3
      )

    results <- results0 |>
      format_results_list(
        biomarker_levels = biomarker_levels,
        biomarker_groups = biomarker_groups
      )

    results |>
      dplyr::glimpse() |>
      expect_snapshot()

    results$samples_sequence <- NULL
    results$samples_f <- NULL
    results$samples_likelihood <- NULL

    results |>
      expect_snapshot_value(style = "serialize")

  }
)

test_that(
  desc = "results are consistent with custom ordering",
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

    biomarker_levels <-
      output_path |>
      fs::path("biomarker_levels.rds") |>
      readr::read_rds()

    biomarker_groups <-
      output_path |>
      fs::path("biomarker_groups.rds") |>
      readr::read_rds()

    results0 <-
      extract_results_from_pickle(
        output_folder = output_path,
        use_rds = FALSE,
        format_results = FALSE,
        n_s = 3
      )

    results <- results0 |>
      format_results_list(
        biomarker_levels = biomarker_levels,
        biomarker_groups = biomarker_groups,
        subtype_order = c(2, 1, 3)
      )

    results |>
      dplyr::glimpse() |>
      expect_snapshot()

  }
)
