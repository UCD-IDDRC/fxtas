test_that(
  desc = "results are consistent",
  code = {
    ft = test_data_v1 |>
      dplyr::filter(!is.na(CGG)) |>
      make_demographics_table(make_ft = FALSE)

    ft |> as.data.frame() |>
      ssdtools:::expect_snapshot_data(name = "demographics-table")
  }
)

test_that(
  desc = "results are consistent 2",
  code = {
    skip_on_ci()
    skip_on_cran()
    html_file <- tempfile(fileext = ".html")
    flextable::save_as_html(ft, path = html_file)
    doconv::expect_snapshot_html(
      vwidth = 1200, # based on what github actions seems to do
      vheight = 744, # these get passed down to `webshot2::webshot()`
      x = html_file,
      name = "demographics_table",
      engine = "testthat"
    )

  }
)

# need better tests here
