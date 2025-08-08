collapse_moderate <- function(x) {
  x |>
    stringr::str_replace("Moderate", "Mod.") |>
    stringr::str_replace("moderate", "mod.")

}
