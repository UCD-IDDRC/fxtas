test_that("results are consistent with fxtas data", {
  withr::local_package("dplyr")
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"
  figs <-
    readr::read_rds(
      testthat::test_path("fixtures", "fxtas-figs4.rds")
    )

  color_info <- tibble::tribble(
    ~event_name, ~line_color, ~highlight_color,
    "MRI: Cerebellar: Mild",  "orange", "#FFF",
    "MRI: Cerebral: Moderate/Severe", "orange", "#FFF",
    "FXTAS Stage: 1", "black", "yellow",
    "FXTAS Stage: 2", "black", "yellow",
    "FXTAS Stage: 3", "black", "yellow",
    "FXTAS Stage: 4", "black", "yellow",
    "FXTAS Stage: 5", "black", "yellow",
    "Ataxia Severity: 1", "magenta", "#FFF",

  )


  figs |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      events_to_highlight = color_info
    ) |>
    vdiffr::expect_doppelganger(title = "fxtas-data-4")

  fig3 <- figs[1:3] |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      use_group_colors = FALSE,
      events_to_highlight = color_info
    )

  fig3 |>
    vdiffr::expect_doppelganger(title = "fxtas-data-3")

  figs[1:2] |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      use_group_colors = FALSE,
      events_to_highlight = color_info
    ) |>
    vdiffr::expect_doppelganger(title = "fxtas-data-2")

  figs[1:2] |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      use_group_colors = TRUE,
      group_colors = figs |> group_colors(),
      events_to_highlight = color_info
    ) |>
    vdiffr::expect_doppelganger(title = "fxtas-data-group-color")

})


test_that("results are consistent with simulated data", {
  withr::local_package("dplyr")

  figs <-
    readr::read_rds(
      testthat::test_path("fixtures", "sim-figs-4.rds")
    )

  events_to_highlight <- tibble::tribble(
    ~event_name, ~line_color, ~highlight_color,
    "Biomarker 2: 1",  "orange", "#FFF"
  )


  figs |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      events_to_highlight = events_to_highlight
    ) |>
    vdiffr::expect_doppelganger(title = "sim-data-4")

  figs[1:3] |>
    pvd_subtype_lineplot(
      facet_label_prefixes = NULL,
      align_stage = FALSE,
      events_to_highlight = events_to_highlight
    ) |>
    vdiffr::expect_doppelganger(title = "sim-data-3")

})
