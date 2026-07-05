# Plot SuStaIn Sequential Estimate

Plot SuStaIn Sequential Estimate

## Usage

``` r
plot_compact_pvd_est2(
  figs,
  tile_height = 1,
  tile_width = 1,
  y_text_size = 9,
  legend.position = "none",
  scale_colors = c("red", "blue", "purple4", "darkgreen", "magenta"),
  rel_heights = c(1, 0.1),
  ...
)
```

## Arguments

- figs:

  todo

- tile_height:

  todo

- tile_width:

  todo

- y_text_size:

  todo

- legend.position:

  todo

- scale_colors:

  todo

- rel_heights:

  relative heights of the plot and the legend

- ...:

  arguments passed to `tmp_func()`

## Examples

``` r
figs <- extract_figs_from_pickle(
  n_s = 4,
  dataset_name = "sample_data",
  output_folder = fs::path_package("fxtas", "extdata/sim_data/"),
  use_rds = TRUE
)

plot_compact_pvd_est2(
  figs = figs,
  tile_height = 1,
  y_text_size = 6,
  title_size = 8
)
```
