test_that("`counts_and_pcts()` produces consistent results", {

  x <- test_data$`ataxia severity*`

  actual <- x |> counts_and_pcts()

  actual |> testthat::expect_snapshot_value(style = "deparse")


})
