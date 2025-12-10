\dontrun{
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"

  results <-
    output_folder |>
    extract_results_from_pickle(
      output_folder = _,
      n_s = 1,
      use_rds = TRUE
    )

  plot1 <-
    plot_positional_var(
      results = results,
      use_labels = TRUE)

  plot1 |>
    vdiffr::expect_doppelganger(title = "plot1")
}
