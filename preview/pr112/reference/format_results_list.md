# Format results list extracted from pickle file

Format results list extracted from pickle file

## Usage

``` r
format_results_list(
  results,
  biomarker_labels = names(biomarker_levels),
  biomarker_levels = NULL,
  biomarker_events_table = get_biomarker_events_table(biomarker_levels),
  biomarker_event_names = biomarker_events_table$biomarker_level,
  format_sst = TRUE,
  n_s = get_n_subtypes(results),
  subtype_order = seq_len(n_s)
)
```

## Arguments

- results:

  pickle file contents

- biomarker_labels:

  biomarker labels

- biomarker_levels:

  biomarker levels

- biomarker_events_table:

  table of biomarker events (excluding base level)

- biomarker_event_names:

  vector of biomarker event names

- format_sst:

  should the subtype and stage table be formatted? (doesn't work for
  cross-validation fold pickle-files)

- n_s:

  number of latent subgroups

- subtype_order:

  [integer](https://rdrr.io/r/base/integer.html) indicating how to
  reorder the subtypes

## Value

a `"SuStaIn_model"` object (extends
[`list()`](https://rdrr.io/r/base/list.html))
