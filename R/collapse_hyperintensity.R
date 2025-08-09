collapse_hyperintensity <- function(x) {
  x |>
    stringr::str_replace("Hyperintensity", "Hyp.") |>
    stringr::str_replace("hyperintensity", "hyp.")

}
