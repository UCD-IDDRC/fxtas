
arrange_position_frequencies <- function(
    position_frequencies,
    biomarker_order = NULL,
    use_labels = FALSE) {

  name_var <- if_else(use_labels, "level_labelled", "event name")

  if (biomarker_order |> is.null()) {
    biomarker_order <-
      position_frequencies |>
      order_biomarkers() |>
      dplyr::pull("event name")
  }

  position_frequencies |>
    dplyr::mutate(
      "event name" =
        .data[["event name"]] |>
        factor(levels = biomarker_order),
      "row number and name" =
        paste(as.numeric(.data[["event name"]]), .data[[name_var]], sep = ") ")
    ) |>
    arrange(pick("event name")) |>
    relocate("row number and name", .before = "event name")
}
