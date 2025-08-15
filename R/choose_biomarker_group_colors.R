choose_biomarker_group_colors <- function(
    biomarker_groups,
    biomarker_group_names = names(biomarker_groups)) {

  biomarker_group_colors <-
    length(biomarker_group_names) |>
    # rainbow() # nolint
    # RColorBrewer::brewer.pal(n = _, name = "Paired")  # nolint
    rcartocolor::carto_pal(n = _, "Safe") |>
  # colorspace::qualitative_hcl(n = _, "Dark2")  # nolint
    setNames(biomarker_group_names)

  biomarker_group_colors[biomarker_group_names == "Stage"] = "black"

  tibble(
    biomarker_group = biomarker_group_names |>
      setNames(biomarker_group_colors),
    group_color = biomarker_group_colors
  )

}
