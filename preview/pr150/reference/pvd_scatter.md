# Scatterplot comparing two PVDs for the same outcomes

Scatterplot comparing two PVDs for the same outcomes

## Usage

``` r
pvd_scatter(
  plot_dataset,
  nrow_colors,
  group_colors,
  legend_text_size = grid::unit(7, "pt")
)
```

## Arguments

- plot_dataset:

  a [data.frame](https://rdrr.io/r/base/data.frame.html)

- nrow_colors:

  an [integer](https://rdrr.io/r/base/integer.html)

- group_colors:

  palette for ggplot2::scale_color_manual

- legend_text_size:

  a [grid::unit](https://rdrr.io/r/grid/unit.html)

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
size_y <- 11
figs <- extract_figs_from_pickle(
  use_rdS = TRUE,
  size.y = size_y,
  n_s = 3,
  rda_filename = "data.RData",
  dataset_name = "sample_data",
  output_folder = fs::path_package("extdata/sim_data", package = "fxtas")
)

y_text_size <- 11
tile_height <- 1
facet_label_prefix <- names(figs)
legend_position <- "none"
scale_colors <- c("red", "blue", "purple4")
plot_dataset <- fxtas:::compact_pvd_data_prep(figs = figs)
# facet labels
facet_names <- fxtas:::compact_pvd_facet_labels(
  figs = figs,
  facet_label_prefix = facet_label_prefix
)
nrow_colors <- 1
group_colors <- figs |> group_colors()

temp_plot <- plot_dataset |> pvd_scatter(
  group_colors = group_colors,
  nrow_colors = nrow_colors
)
```
