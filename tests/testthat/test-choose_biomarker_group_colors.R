test_that("results are consistent", {

  groups <- c("Tremors", "Ataxia", "Stage", "Parkinson's disease", "MRI",
              "Scores", "SCID", "CANTAB", "Thyroid")

  groups |>
    choose_biomarker_group_colors(biomarker_group_names = _) |>
    expect_snapshot_value(style = "deparse")

})
