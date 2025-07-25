format_samples_sequence <- function(
    samples_sequence = results$samples_sequence,
    biomarker_event_names =
      biomarker_levels |>
      get_biomarker_event_names(),
    results,
    biomarker_levels =
      results$biomarker_levels,
    n_s = dim(results$sample_sequence)[1],
    subtype_order = seq_len(n_s))
{
  n_events = dim(samples_sequence)[2]
  stopifnot(n_events == length(biomarker_event_names))
  stopifnot(is.numeric(samples_sequence))

  samples_sequence[] = biomarker_event_names[samples_sequence + 1]
  samples_sequence <- structure(
      samples_sequence[subtype_order, , ],
      subtype_order = subtype_order,
      class = union("samples_sequence", class(samples_sequence))
    )

  dimnames(samples_sequence) =
    # dim(samples_sequence) |>
    # lapply(seq_len) |>
    # set_names(c("subgroup", "position", "iteration"))
    list(
    "subgroup" = paste("Subtype", 1:n_s),
    "position" = seq_len(dim(samples_sequence)[2]) |> as.character(),
    "iteration" = NULL)
  return(samples_sequence)

}
