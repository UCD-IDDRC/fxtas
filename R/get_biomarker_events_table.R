#' Construct biomarker events table
#'
#' @param biomarker_levels todo
#' @param do_factor
#' whether to turn `biomarker` column into factor and sort on it, after `level`
#' @returns a [tibble::tbl_df]
#' @export
#' @examples
#' df <- test_data_v1
#' biomarker_groups <- compile_biomarker_groups_table(dataset = df)
#' biomarker_varnames <-
#'   biomarker_groups |>
#'   dplyr::pull("biomarker")
#'
#' biomarker_levels <-
#'   df |>
#'   get_levels(biomarker_varnames, keep_labels = TRUE)
#'
#' get_biomarker_events_table(biomarker_levels)
get_biomarker_events_table <- function(biomarker_levels, do_factor = TRUE) {

  var_labels <- biomarker_levels |>
    get_var_labels1()

  var_labels_long <-
    var_labels |>
    expand_PAL() |>
    expand_RTI() |>
    expand_SWM() |>
    expand_BDS2() |>
    expand_MMSE() |>
    expand_MCP()

  var_labels_reversed <- names(biomarker_levels) |> setNames(var_labels)
  to_return <-
    biomarker_levels |>
    tibble::enframe() |>
    dplyr::mutate(
      label = var_labels,
      label_long = var_labels_long
    ) |>
    labelled::set_value_labels(name = var_labels_reversed) |>
    tidyr::unnest_longer("value") |>
    dplyr::rename(
      biomarker = "name",
      biomarker_label = "label",
      biomarker_label_long = "label_long",
      level = "value"
    ) |>
    dplyr::relocate(
      "biomarker",
      "biomarker_label",
      "biomarker_label_long",
      .before = everything()
    ) |>
    dplyr::mutate(
      biomarker_level = if_else(
        .data$level == "Yes",
        .data$biomarker,
        .data$biomarker |> paste(.data$level, sep = ": ")
      ),
      level_labelled = if_else(
        .data$level == "Yes",
        .data$biomarker_label,
        .data$biomarker_label |> paste(.data$level, sep = ": ")
      )

    )

  level_labels_reversed <-
    to_return$biomarker_level |> setNames(to_return$level_labelled)

  to_return <- to_return |>
    labelled::set_value_labels(
      biomarker_level = level_labels_reversed
    ) |>
    dplyr::mutate(
      .by = "biomarker",
      levels = paste(.data$level, collapse = ", "),
      level = dplyr::row_number(),
    ) |>
    dplyr::filter(.data$level > 1)

  if (do_factor) {
    to_return <- to_return |>
      dplyr::mutate(
        biomarker = .data$biomarker |>
          factor(levels = names(biomarker_levels))
      ) |>
      arrange(across(all_of(c("level", "biomarker")))) |>
      dplyr::mutate(
        biomarker = .data$biomarker |> as.character()
      )


  } else {
    to_return <- to_return |>
      arrange(across(all_of(c("level"))))
  }

  to_return
}
