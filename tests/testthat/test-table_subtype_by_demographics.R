test_that(
  desc = "results are consistent",
  code = {
    withr::local_package("dplyr")
    patient_data <- sim_data |> dplyr::filter(Category == "Patient")
    table <- sim_subtype_and_stage_table
    set.seed(1)
    ft <- table_subtype_by_demographics(
      patient_data,
      table,
      demographic_vars = "Sex",
      footnotes_as_letters = FALSE
    )

    ft |>
      as.data.frame() |>
      ssdtools:::expect_snapshot_data(name = "table-st-by-demo")
  }
)

test_that(
  desc = "results are consistent 2",
  code = {

    withr::local_package("dplyr")
    patient_data <- sim_data |> dplyr::filter(Category == "Patient")
    table <- sim_subtype_and_stage_table
    set.seed(1)
    ft <- table_subtype_by_demographics(
      patient_data,
      table,
      demographic_vars = "Sex",
      footnotes_as_letters = FALSE
    )

    ft |>
      as.data.frame() |>
      ssdtools:::expect_snapshot_data(name = "table_subtype_by_demographics")

    skip_on_ci()
    ft |>
      gtsummary::as_flex_table() |>
      shared_flextable_settings(padding = 2) |>
      flextable::gen_grob(fit = "fixed") |>
      vdiffr::expect_doppelganger(title = "table_subtype_by_demographics")

  }
)
