# Display Sequential Order of Events by Subtype

Display Sequential Order of Events by Subtype

## Usage

``` r
pvd_subtype_lineplot(
  figs,
  events_to_highlight,
  min_alpha = 0.25,
  max_alpha = 1,
  stage_alpha = 1,
  facet_labels = names(figs),
  text_size = 3.4,
  y_lab = "Sequential order",
  y_title_size = 9,
  y_text_size = 8,
  x_text_size = 8,
  subtype_x = c(1, 3, 5, 7),
  mult = 0.2,
  ...
)
```

## Arguments

- figs:

  A [list](https://rdrr.io/r/base/list.html) of todo

- events_to_highlight:

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

- subtype_x:

  Vector of x-axis value for the subtypes.

- mult:

  [numeric](https://rdrr.io/r/base/numeric.html) vector

- ...:

  additional arguments passed to
  [ggbump::geom_bump](https://rdrr.io/pkg/ggbump/man/geom_bump.html)
  Default = c(1, 1.15, 1.75, 2.35)
