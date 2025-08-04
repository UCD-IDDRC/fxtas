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
    biomarker_event_names = biomarker_events_table |> get_biomarker_event_names(),
    format_sst = TRUE,
    n_s = get_n_subtypes(results),
    subtype_order = seq_len(n_s),
    biomarker_groups) {


  n_events <- nrow(biomarker_events_table)
  # here's what the python code does to reorder the subtype and stage labels:
  temp_mean_f <- results$samples_f |> rowMeans()
  ix <- order(temp_mean_f, decreasing = TRUE)
  order_sst <- order(ix)[subtype_order]
  results <- results |>
    structure(
      class = union("SuStaIn_model", class(results)),
      n_s = n_s,
      biomarker_groups = biomarker_groups,
      biomarker_levels = biomarker_levels,
      subtype_order = subtype_order,
      ix = ix,
      n_events = n_events
    )

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
      extract_subtype_and_stage_table(subtype_order = order_sst)
  }

  results$ml_subtype_old <- results$ml_subtype[,1]

  results$ml_subtype <- results$ml_subtype[,1] |>
    format_ml_subtype(
      n_subtypes = n_s,
      ml_stage = results$ml_stage[,1],
      subtype_order = order_sst)

  results$samples_f <- results$samples_f |>
    format_samples_f(subtype_order = subtype_order)

  results$ml_f_EM <- results$ml_f_EM |>
    format_ml_f_EM(subtype_order = subtype_order)

  results$ml_f_prev_EM <- results$ml_f_prev_EM |>
    format_ml_f_EM(subtype_order = subtype_order)

  results$prob_subtype <- results$prob_subtype |>
    format_prob_subtype(subtype_order = order_sst)

  results$prob_stage <- results$prob_stage |>
    format_prob_stage()

  results$prob_ml_stage <- results$prob_ml_stage[, 1]
  results$prob_ml_subtype <- results$prob_ml_subtype[, 1]

  results$prob_subtype_stage <- results$prob_subtype_stage |>
    format_prob_subtype_stage(subtype_order = order_sst)

  results$ml_sequence_EM <- results$ml_sequence_EM |>
    format_ml_sequence_EM(subtype_order = subtype_order)

  results$ml_sequence_prev_EM <- results$ml_sequence_prev_EM |>
    format_ml_sequence_EM(subtype_order = subtype_order)

  return(results)
}
