# Graphical Abstract

Graphical Abstract

## Usage

``` r
graphical_abstract(
  figs,
  tile_height = 1,
  y_text_size = 9,
  facet_label_prefix = names(figs),
  legend.position = "none",
  scale_colors = c("red", "blue", "magenta", "darkgreen", "purple4"),
  rel_heights = c(1, 0.1),
  ncol_legend = 2,
  nrow_colors = 2,
  guide_rel_widths = c(0.7, 0.3),
  legend_text_size = grid::unit(8, "pt"),
  abstract,
  abstract_size = 5,
  abstract_width = 50,
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

- rel_heights:

  (optional) Numerical vector of relative rows heights. Works just as
  `rel_widths` does, but for rows rather than columns.

- ncol_legend:

  how many columns to use for legend

- nrow_colors:

  now many rows to use for color guide

- guide_rel_widths:

  relative widths of guides

- legend_text_size:

  [grid::unit](https://rdrr.io/r/grid/unit.html): legend text size

- abstract:

  [character](https://rdrr.io/r/base/character.html) String that
  summarizes the study's main findings.

- abstract_size:

  [numeric](https://rdrr.io/r/base/numeric.html) Abstract text size

- abstract_width:

  [numeric](https://rdrr.io/r/base/numeric.html) Length at which to wrap
  the abstract text.

- ...:

  List of plots to be arranged into the grid. The plots can be any
  objects that the function
  [`as_gtable()`](https://wilkelab.org/cowplot/reference/as_gtable.html)
  can handle (see also examples).

## Value

a [ggplot2::ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html)
