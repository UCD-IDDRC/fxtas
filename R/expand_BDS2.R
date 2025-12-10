expand_BDS2 <- function(x) {
  x |>
    stringr::str_replace("^BDS-2 ", "Behavior Dyscontrol Scale - 2nd Edition (BDS-2): ")
}
