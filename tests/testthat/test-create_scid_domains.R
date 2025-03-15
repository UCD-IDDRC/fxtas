test_that("results are consistent", {

  test_data |>
    distinct(across(all_of(all_scid_vars))) |>
    create_scid_domains() |>
    ssdtools:::expect_snapshot_data("scid-domains")
})
