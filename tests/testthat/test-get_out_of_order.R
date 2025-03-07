test_that("results are consistent", {
  skip_if_not(exists("gp34"))
  test <-
    gp34 |> get_out_of_order()

  expect_snapshot_value(test, style = "serialize")
})
