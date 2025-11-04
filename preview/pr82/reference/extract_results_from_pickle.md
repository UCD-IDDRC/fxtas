# Extract results from pickle file

Extract results from pickle file

## Usage

``` r
extract_results_from_pickle(
  n_s = 1,
  dataset_name = "sample_data",
  output_folder = "output",
  rda_filename = "data.RData",
  basename = paste0(dataset_name, "_subtype", n_s - 1),
  picklename = paste0(basename, ".pickle"),
  format_results = TRUE,
  use_rds = TRUE,
  verbose = FALSE,
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

- basename:

  base of pickle file name (without `.pickle` suffix)

- picklename:

  the name of the pickle file to open

- format_results:

  whether to apply
  [`format_results_list()`](https://UCD-IDDRC.github.io/fxtas/preview/pr82/reference/format_results_list.md)
  to results before returning

- use_rds:

  [logical](https://rdrr.io/r/base/logical.html) whether to use
  previously cached results

- verbose:

  whether to print messages

- ...:

  Arguments passed on to
  [`format_results_list`](https://UCD-IDDRC.github.io/fxtas/preview/pr82/reference/format_results_list.md)

  `format_sst`

  :   should the subtype and stage table be formatted? (doesn't work for
      cross-validation fold pickle-files)

## Value

a `"SuStaIn_model"` object (extends
[`list()`](https://rdrr.io/r/base/list.html))

## Examples

``` r
output_path =
  fs::path_package("extdata/sim_data", package = "fxtas")
results = extract_results_from_pickle(output_folder = output_path)
```
