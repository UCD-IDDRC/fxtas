test_that("results are consistent", {
  output_path =
    fs::path_package("extdata/sim_data", package = "fxtas")

  figs = extract_figs_from_pickle(
    output_folder = output_path,
    n = 4)

  events_to_highlight <- tibble::tribble(
    ~event_name, ~line_color, ~highlight_color,
    "Biomarker 2: 1",  "orange", "#FFF")


  figs |>
    pvd_subtype_lineplot(events_to_highlight = events_to_highlight) |>
    vdiffr::expect_doppelganger(title = "sim-data-4")

  figs[1:3] |>
    pvd_subtype_lineplot(events_to_highlight = events_to_highlight) |>
    vdiffr::expect_doppelganger(title = "sim-data-3")

})
