expand_BDS2 <- function(x) {
  x |>
    stringr::str_replace("^BDS-2 ", "Behavior Dyscontrol Scale - Second Edition (BDS-2): ")
}
