# Plot compact PVD tmp function using list of extract_figs_from_pickle

Plot compact PVD tmp function using list of extract_figs_from_pickle

## Usage

``` r
plot_compact_pvd(
  figs,
  tile_height = 1,
  y_text_size = 9,
  facet_label_prefix = names(figs),
  legend.position = "none",
  scale_colors = c("red", "blue", "purple4", "darkgreen", "magenta"),
  ...
)
```

## Arguments

- figs:

  todo

- tile_height:

  todo

- y_text_size:

  todo

- facet_label_prefix:

  todo

- legend.position:

  todo

- scale_colors:

  todo

- ...:

  Arguments passed on to
  [`compact_pvd_data_prep`](https://UCD-IDDRC.github.io/fxtas/preview/pr104/reference/compact_pvd_data_prep.md)

  `biomarker_order`

  :   a [character](https://rdrr.io/r/base/character.html) vector
      specifying the order of biomarkers to use

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

figs <- extract_figs_from_pickle(
  output_folder = output_path,
  n = 3
)

figs |> plot_compact_pvd(scale_colors = c("red", "blue", "purple4"))
```
