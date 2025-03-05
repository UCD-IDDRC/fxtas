test_that("results are consistent", {
  results = extract_results_from_pickle(
    n_s = n_s,
    dataset_name = dataset_name,
    output_folder = output_folder,
    rda_filename = rda_filename,
    picklename = picklename,
    use_rds = use_rds)

  biomarker_groups =
    output_folder |>
    fs::path("biomarker_groups.rds") |>
    readr::read_rds()

  biomarker_levels =
    output_folder |>
    fs::path("biomarker_levels.rds") |>
    readr::read_rds()


  plot_positional_var(
    results = results,
    biomarker_groups = biomarker_groups,
    biomarker_levels = biomarker_levels,
    ...)
})
