test_that(
  desc = "compute_prob_correct() produces consistent results",
  code = {
    full_data <- test_data_v1

    v1_usable <- full_data |> dplyr::filter(CGG < 200)

    biomarker_groups <- compile_biomarker_groups_table(
      dataset = v1_usable
    )

    biomarker_varnames <-
      biomarker_groups |>
      dplyr::pull("biomarker")

    biomarker_levels <-
      v1_usable |>
      get_levels(biomarker_varnames)

    control_data <-
      v1_usable |>
      dplyr::filter(`FX*` == "CGG <55") |>
      dplyr::select(all_of(biomarker_varnames))

    prob_correct = control_data |>
      compute_prob_correct(max_prob = .95,
                           biomarker_levels = biomarker_levels)

    prob_correct |>
      attr("data") |>
      ssdtools:::expect_snapshot_data(name = "prob-correct")

    library(flextable)
    ft = prob_correct |>
      attr("data") |>
      flextable::flextable() |>
      shared_flextable_settings() |>
      width(width = 1)

    html_file <- tempfile(fileext = ".html")
    flextable::save_as_html(ft, path = html_file)
    doconv::expect_snapshot_html(
      x = html_file,
      name = "prob_correct_table",
      engine = "testthat"
    )

  }
)
