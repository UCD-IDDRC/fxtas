set_scid_label <- function(x) {
  x |>
    set_label_attribute(
      value = labelled::var_label(x) |>
        stringr::str_replace(fixed("SCID: "), "")
    )
}
