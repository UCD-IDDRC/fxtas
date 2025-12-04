# Plot positional variance diagram

Plot positional variance diagram

## Usage

``` r
plot_positional_var(
  results,
  samples_sequence = results$samples_sequence,
  samples_f = results$samples_f,
  n_samples = nrow(results$ml_subtype),
  score_vals = build_score_vals(biomarker_levels),
  biomarker_labels = labelled:::var_label.data.frame(biomarker_levels, null_action =
    "fill", unlist = TRUE),
  biomarker_groups = attr(results, "biomarker_groups"),
  biomarker_levels = attr(results, "biomarker_levels"),
  biomarker_events_table = get_biomarker_events_table(biomarker_levels),
  biomarker_event_names = get_biomarker_event_names(biomarker_events_table),
  biomarker_plot_order = NULL,
  ml_f_EM = NULL,
  cval = FALSE,
  subtype_order = seq_len(dim(samples_sequence)[1]),
  biomarker_order = NULL,
  title_font_size = 12,
  stage_font_size = 10,
  stage_label = "Sequential order",
  stage_rot = 0,
  stage_interval = 1,
  label_font_size = 10,
  label_rot = 0,
  cmap = "original",
  biomarker_colours = NULL,
  subtype_titles = NULL,
  separate_subtypes = FALSE,
  save_path = NULL,
  save_kwargs = NULL,
  synchronize_y_axes = FALSE,
  use_labels = TRUE,
  ...
)
```

## Arguments

- results:

  todo

- samples_sequence:

  todo

- samples_f:

  todo

- n_samples:

  todo

- score_vals:

  todo

- biomarker_labels:

  todo

- biomarker_groups:

  biomarker groupings

- biomarker_levels:

  doesn't do much right now

- biomarker_events_table:

  todo

- biomarker_event_names:

  todo

- biomarker_plot_order:

  todo

- ml_f_EM:

  todo

- cval:

  todo

- subtype_order:

  todo

- biomarker_order:

  todo

- title_font_size:

  todo

- stage_font_size:

  todo

- stage_label:

  todo

- stage_rot:

  todo

- stage_interval:

  todo

- label_font_size:

  todo

- label_rot:

  todo

- cmap:

  a [character](https://rdrr.io/r/base/character.html)

- biomarker_colours:

  a [character](https://rdrr.io/r/base/character.html) vector of colors

- subtype_titles:

  todo

- separate_subtypes:

  todo

- save_path:

  todo

- save_kwargs:

  todo

- synchronize_y_axes:

  todo

- use_labels:

  whether to use biomarker labels or variable names

- ...:

  Arguments passed on to
  [`autoplot.PF`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/autoplot.PF.md)

  `object`

  :   a "PF" object (created by `compute_position_frequencies()`)

  `size.y`

  :   size of biomarker event labels

  `color_label`

  :   label for legend color scale

## Value

a `"PVD_list` (a [list](https://rdrr.io/r/base/list.html) of `PVD`
objects from
[`autoplot.PF()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/autoplot.PF.md))

## Examples

``` r
if (FALSE) { # \dontrun{
  output_folder <-
    "output/output.fixed_CV-scid-no-subthres/"

  results <-
    output_folder |>
    extract_results_from_pickle(
      output_folder = _,
      n_s = 1,
      use_rds = TRUE
    )

  plot1 <-
    plot_positional_var(
      results = results,
      use_labels = TRUE)

  plot1 |>
    vdiffr::expect_doppelganger(title = "plot1")
} # }
```
