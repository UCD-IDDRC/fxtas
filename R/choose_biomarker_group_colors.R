choose_biomarker_group_colors <- function(
    biomarker_groups,
    biomarker_group_names = names(biomarker_groups)) {
  tibble(
    biomarker_group = biomarker_group_names
  ) |>
    dplyr::mutate(
      group_color = if_else(
        .data$biomarker_group == "Stage",
        "black",
        # rainbow() # nolint
        # RColorBrewer::brewer.pal(n = n(), name = "Paired")  # nolint
        rcartocolor::carto_pal(n = dplyr::n(), "Safe"),
        # colorspace::qualitative_hcl(n = dplyr::n(), "Dark2")  # nolint
      )
    )

}
