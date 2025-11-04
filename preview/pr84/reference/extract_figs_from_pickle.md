# Extact PVDs from pickle file

Extact PVDs from pickle file

## Usage

``` r
extract_figs_from_pickle(
  n_s = 1,
  dataset_name = "sample_data",
  output_folder = "output",
  rda_filename = "data.RData",
  picklename = paste0(dataset_name, "_subtype", n_s - 1, ".pickle"),
  use_rds = TRUE,
  ...
)
```

## Arguments

- n_s:

  helps construct `picklename` by identifying number of latent subgroups

- dataset_name:

  root name of dataset

- output_folder:

  where to find the dataset

- rda_filename:

  name of rda file containing environment used to run analyses

- picklename:

  the name of the pickle file to open

- use_rds:

  [logical](https://rdrr.io/r/base/logical.html) whether to use
  previously cached results

- ...:

  Arguments passed on to
  [`plot_positional_var`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/plot_positional_var.md)

  `samples_sequence`

  :   todo

  `samples_f`

  :   todo

  `n_samples`

  :   todo

  `score_vals`

  :   todo

  `biomarker_labels`

  :   todo

  `ml_f_EM`

  :   todo

  `cval`

  :   todo

  `subtype_order`

  :   todo

  `biomarker_order`

  :   todo

  `title_font_size`

  :   todo

  `stage_font_size`

  :   todo

  `stage_label`

  :   todo

  `stage_rot`

  :   todo

  `stage_interval`

  :   todo

  `label_font_size`

  :   todo

  `label_rot`

  :   todo

  `cmap`

  :   a [character](https://rdrr.io/r/base/character.html)

  `biomarker_colours`

  :   a [character](https://rdrr.io/r/base/character.html) vector of
      colors

  `subtype_titles`

  :   todo

  `separate_subtypes`

  :   todo

  `save_path`

  :   todo

  `save_kwargs`

  :   todo

  `results`

  :   todo

  `biomarker_levels`

  :   doesn't do much right now

  `biomarker_groups`

  :   biomarker groupings

  `biomarker_events_table`

  :   todo

  `biomarker_event_names`

  :   todo

  `biomarker_plot_order`

  :   todo

  `synchronize_y_axes`

  :   todo

## Value

a `"PVD.list` (a [list](https://rdrr.io/r/base/list.html) of `PVD`
objects from
[`autoplot.PF()`](https://UCD-IDDRC.github.io/fxtas/preview/pr84/reference/autoplot.PF.md))

## Examples

``` r
output_path <-
  fs::path_package("extdata/sim_data", package = "fxtas")

if (dir.exists(output_path)) {
  figs <- extract_figs_from_pickle(
    output_folder = output_path,
    n = 3
  )

  figs
}
#> $`Group 1`

#> 
#> $`Group 2`

#> 
#> $`Group 3`

#> 
#> attr(,"class")
#> [1] "PVD.list" "list"    
#> attr(,"biomarker_event_names")
#>  [1] "Biomarker 1: 1" "Biomarker 2: 1" "Biomarker 3: 1" "Biomarker 4: 1"
#>  [5] "Biomarker 5: 1" "Biomarker 1: 2" "Biomarker 2: 2" "Biomarker 3: 2"
#>  [9] "Biomarker 4: 2" "Biomarker 5: 2" "Biomarker 1: 3" "Biomarker 2: 3"
#> [13] "Biomarker 3: 3" "Biomarker 4: 3" "Biomarker 5: 3"
```
