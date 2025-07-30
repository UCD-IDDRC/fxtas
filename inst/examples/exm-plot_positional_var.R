\dontrun{
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"

  results <-
    output_folder |>
    extract_results_from_pickle(
      output_folder = _,
      n_s = 1,
      use_rds = FALSE
    )

  plot1 <-
    plot_positional_var(
      results = results,
      biomarker_groups = biomarker_groups,
      biomarker_levels = biomarker_levels)

  plot1 |>
    vdiffr::expect_doppelganger(title = "plot1")
}
