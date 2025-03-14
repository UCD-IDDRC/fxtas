obs_to_use <-
  trax_gp34_all |>
  dplyr::select(`FXS ID`, `Event Name`)

usethis::use_data(obs_to_use, overwrite = TRUE)
