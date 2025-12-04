# Extract results from multiple pickle files

Extract results from multiple pickle files

## Usage

``` r
extract_results_from_pickles(
  n_s = 1,
  dataset_name = "sample_data",
  output_folder = "output",
  rda_filename = "data.RData",
  basename = paste0(dataset_name, "_subtype", n_s - 1),
  picklename = paste0(basename, ".pickle"),
  format_results = TRUE,
  subtype_order = seq_len(n_s),
  use_rds = TRUE,
  save_rds = format_results & identical(subtype_order, seq_len(n_s)),
  verbose = FALSE,
  ...
)
```

## Arguments

- n_s:

  number of latent subgroups; helps construct `picklename`

- dataset_name:

  root name of dataset

- output_folder:

  where to find the dataset

- rda_filename:

  name of rda file containing environment used to run analyses

- basename:

  base of pickle file name (without `.pickle` suffix)

- picklename:

  the name of the pickle file to open

- format_results:

  whether to apply
  [`format_results_list()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/format_results_list.md)
  to results before returning

- subtype_order:

  an [integer](https://rdrr.io/r/base/integer.html) vector of length
  `n_s`, indicating how to order the subtypes

- use_rds:

  [logical](https://rdrr.io/r/base/logical.html) whether to use
  previously cached results

- save_rds:

  a [logical](https://rdrr.io/r/base/logical.html) indicating whether to
  save new cached results

- verbose:

  whether to print messages

- ...:

  Arguments passed on to
  [`format_results_list`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/format_results_list.md)

  `format_sst`

  :   should the subtype and stage table be formatted? (doesn't work for
      cross-validation fold pickle-files)

## Value

a [list](https://rdrr.io/r/base/list.html) of `"SuStaIn_model"` objects
(extends [`list()`](https://rdrr.io/r/base/list.html))
