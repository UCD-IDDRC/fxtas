test_that("works", {
  x <- 1 |> set_label_attribute("SCID: hello")
  x |>
    set_scid_label() |>
    var_label() |>
    expect_equal("hello")
})
