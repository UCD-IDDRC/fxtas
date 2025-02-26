heatmap_table_to_plot <- function(heatmap_table) {
  heatmap_table |>
    ggplot(
      aes(
        x = .data$SuStaIn.Stage,
        y = .data$biomarker,
        fill =
          rgb(
            red = .data$R,              #Specify Bands
            green = .data$G,
            blue = .data$B,
            maxColorValue = 1
          )
      )
    ) +
    scale_fill_identity() +
    scale_y_discrete(limits = rev) +
    xlab("Sequential order") +
    ylab(NULL) +
    geom_raster(show.legend = FALSE) +
    theme_bw()
}
