test_that("works as expected", {
  actual <-
    c("No", NA, "Yes", "No", "Yes", NA) |>
    incomplete_dx_data()

  expected <-
    c(FALSE, FALSE, FALSE, TRUE, FALSE, TRUE)

  expect_equal(actual, expected)
})
