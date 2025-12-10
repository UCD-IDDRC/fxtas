set_scid_labels <- function(data) {
  data |>
    mutate(
      across(
        tidyselect::starts_with("SCID"),
        set_scid_label
      )
    )

}
