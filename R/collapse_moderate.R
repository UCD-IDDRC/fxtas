collapse_moderate <- function(x) {
  x |>
    stringr::str_replace("Moderate.Severe", "Mod./Severe") |>
    stringr::str_replace("moderate.severe", "mod./severe")

}
