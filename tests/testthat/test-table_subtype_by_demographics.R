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

    skip_on_ci()

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

    html_file <- tempfile(fileext = ".html")

    if (ft |> inherits("gt_tbl")) {
      gt::gtsave(ft, filename = html_file)
    } else {
      ft <- gtsummary::as_flex_table(ft)
      flextable::save_as_html(ft, path = html_file)
    }

    skip_if_not_installed("chromote")
    suppressMessages(is_there_chrome <- chromote::find_chrome())
    skip_if(is.null(is_there_chrome))

    doconv::expect_snapshot_html(
      x = html_file,
      vwidth = 1200, # based on what github actions seems to do
      vheight = 744, # these get passed down to `webshot2::webshot()`
      name = "table_subtype_by_demographics",
      engine = "testthat"
    )
  }
)
