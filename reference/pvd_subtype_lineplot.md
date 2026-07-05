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
  facet_names = names(figs),
  facet_label_prefixes = NULL,
  facet_labels = unlist(compact_pvd_facet_labels(figs = figs, facet_label_prefix =
    facet_label_prefixes)),
  text_size = 3.4,
  y_lab = "Sequential order",
  y_title_size = 9,
  y_text_size = 8,
  x_text_size = 8,
  subtype_x = c(1, 3, 5, 7),
  mult = 0.2,
  align_stage = TRUE,
  use_group_colors = FALSE,
  group_cols = group_colors(figs),
  legend_text_size = grid::unit(7, "pt"),
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

- facet_names:

  [character](https://rdrr.io/r/base/character.html): facet names

- facet_label_prefixes:

  [character](https://rdrr.io/r/base/character.html): prefixes for facet
  labels

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

- align_stage:

  [logical](https://rdrr.io/r/base/logical.html) whether to align by
  FXTAS stage

- use_group_colors:

  [logical](https://rdrr.io/r/base/logical.html): whether to use
  existing group colors or custom line colors from `events_to_highlight`
  argument

- group_cols:

  a named [character](https://rdrr.io/r/base/character.html)
  [vector](https://rdrr.io/r/base/vector.html) mapping from
  `biomarker_group` to a color palette

- legend_text_size:

  [grid::unit](https://rdrr.io/r/grid/unit.html): legend text size

- ...:

  additional arguments passed to
  [ggbump::geom_bump](https://rdrr.io/pkg/ggbump/man/geom_bump.html)
  Default = c(1, 1.15, 1.75, 2.35)
