devtools::load_all()
file_path <- testthat::test_path("fixtures", "gp34_raw.rds")
gp34_raw <- readr::read_rds(file_path)
library(dplyr)
scid_domain_test_data <-
  gp34_raw |>
  distinct(across(all_of(all_scid_vars)))

scid_domain_test_data |>
  readr::write_rds(
  testthat::test_path("fixtures", "scid-domain-test-data.rds")
)

# not used currently; using test_data instead
