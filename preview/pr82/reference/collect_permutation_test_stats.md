# Collect permutation test statistics

Collect permutation test statistics

## Usage

``` r
collect_permutation_test_stats(
  permuting_variables,
  stratifying_levels = "",
  output_folder = fs::path(here::here(), "output/output.fixed_CV"),
  permutation_results_folder_path = fs::path(output_folder, "permutations",
    paste(fs::path_sanitize(stratifying_levels), collapse = "-"),
    paste(fs::path_sanitize(permuting_variables), collapse = "-"), "test_stats"),
  file_stem = "permuted_test_stats",
  seeds = 1:1000,
  by = 20
)
```

## Arguments

- permuting_variables:

  which variables to permute

- stratifying_levels:

  which variables to stratify by

- output_folder:

  where to find the `permutations/test_stats` subfolder

- permutation_results_folder_path:

  path to folder containing `.rds` files with permuted test statistics

- file_stem:

  stem of test stat .rds files

- seeds:

  seeds to find

- by:

  number of seeds per file

## Value

a [numeric](https://rdrr.io/r/base/numeric.html) vector

## Examples

``` r
if (FALSE) { # \dontrun{
test_stats = collect_permutation_test_stats("output/output.fixed_CV")
} # }
```
