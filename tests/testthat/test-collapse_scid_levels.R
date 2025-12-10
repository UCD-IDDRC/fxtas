test_that("results are consistent with custom collapse levels", {
  ordered(c(NA, "Threshold", "Absent", "Sub-Threshold")) |>
    collapse_scid_level(c("Sub-Threshold", "Threshold")) |>
    expect_snapshot()
})

test_that("results are consistent with default collapse levels", {
  ordered(c(NA, "Threshold", "Absent", "Sub-Threshold")) |>
    collapse_scid_level() |>
    expect_snapshot()
})
