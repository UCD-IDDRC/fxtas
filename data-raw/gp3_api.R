library(REDCapTidieR)

# create_credential_local("inst/extdata/apicred.credentials")

credential  <- REDCapR::retrieve_credential_local(
  path_credential = "inst/extdata/apicred.credentials",
  project_id = 172
)


ds <- read_redcap(credential$redcap_uri, credential$token)

ds |> rmarkdown::paged_table()

usethis::use_data(gp3_api, overwrite = TRUE)
