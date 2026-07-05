# Write permuted test stats as RDS

Write permuted test stats as RDS

## Usage

``` r
write_permuted_test_stats(
  permuted_test_stats,
  permutations = names(permuted_test_stats),
  output_folder,
  verbose = TRUE
)
```

## Arguments

- permuted_test_stats:

  a named [`numeric()`](https://rdrr.io/r/base/numeric.html) vector of
  permuted test statistics

- permutations:

  the vector of permutation seeds used to generate `permuted_test_stats`

- output_folder:

  where to create a `test_stats` folder and save `permuted_test_stats`
  as an .rds file

- verbose:

  whether to print informative messages about progress
