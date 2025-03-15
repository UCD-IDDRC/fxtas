test_that("results are stable", {
  iris |>
    add_default_labels() |>
    labelled::var_label(unlist = TRUE) |>
    unname() |>
    expect_equal(
      expected = names(iris))
})
