# Plot change in Stage ranking

Plot change in Stage ranking

## Usage

``` r
pvd_lineplot(
  figs,
  events_to_highlight = NULL,
  highlight_color = NA,
  min_alpha = 0.25,
  max_alpha = 1,
  stage_alpha = 1,
  facet_labels = names(figs),
  text_size = 3.4,
  y_lab = "Sequential order",
  y_title_size = 9,
  y_text_size = 8,
  x_text_size = 8
)
```

## Arguments

- figs:

  a [list](https://rdrr.io/r/base/list.html) of todo

- events_to_highlight:

  todo

- highlight_color:

  todo

- min_alpha:

  todo

- max_alpha:

  todo

- stage_alpha:

  todo

- facet_labels:

  todo

- text_size:

  todo

- y_lab:

  todo

- y_title_size:

  todo

- y_text_size:

  todo

- x_text_size:

  todo

## Examples

``` r
output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

figs <- extract_figs_from_pickle(
  output_folder = output_path,
  n = 3
)

figs[1:2] |> pvd_lineplot()
```
