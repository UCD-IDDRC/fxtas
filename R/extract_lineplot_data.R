extract_lineplot_data <- function(figs, facet_labels) {
  if (length(figs) == 1) {
    # extract data from pvd fig object
    dataset <- dplyr::bind_rows(figs[[1]]$data, .id = "facet")
  } else {
    # update list names
    names(figs) <- facet_labels
    # extract data from list of pvd fig object
    dataset <- dplyr::bind_rows(
      lapply(
        figs,
        function(x) {
          x$data
        }
      ),
      .id = "facet"
    ) |>
      dplyr::mutate(
        facet = .data$facet |> factor(levels = names(figs))
      )
  }
  return(dataset)
}
