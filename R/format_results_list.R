#' Format results list extracted from pickle file
#'
#' @param results pickle file contents
#' @param biomarker_labels biomarker labels
#' @param biomarker_levels biomarker levels
#' @param biomarker_events_table table of biomarker events
#' (excluding base level)
#' @param biomarker_event_names vector of biomarker event names
#' @param format_sst should the subtype and stage table be formatted?
#' (doesn't work for cross-validation fold pickle-files)
#' @param n_s number of latent subgroups
#' @param subtype_order [integer] indicating how to reorder the subtypes
#' @param biomarker_groups a [list]
#' @returns a `"SuStaIn_model"` object (extends [list()])
#'
format_results_list <- function(
    results,
    biomarker_labels = names(biomarker_levels),
    biomarker_levels = NULL,
    biomarker_events_table = get_biomarker_events_table(biomarker_levels),
    biomarker_event_names = biomarker_events_table$biomarker_level,
    format_sst = TRUE,
    n_s = get_n_subtypes(results),
    subtype_order = seq_len(n_s),
    biomarker_groups) {

  results$samples_sequence <-
    results$samples_sequence |>
    format_samples_sequence(
      results = results,
      biomarker_event_names = biomarker_event_names,
      subtype_order = subtype_order
    )

  if (format_sst) {
    results$subtype_and_stage_table <-
      results |>
      extract_subtype_and_stage_table(subtype_order = subtype_order)
  }

  results$samples_f

  results <- results |>
    structure(
      class = union("SuStaIn_model", class(results)),
      biomarker_groups = biomarker_groups,
      biomarker_levels = biomarker_levels
    )

  return(results)
}
