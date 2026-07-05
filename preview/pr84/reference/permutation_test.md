# Compute permutation test p-value

Compute permutation test p-value

## Usage

``` r
permutation_test(permuted_test_stats, observed_test_stat, n_permutations = Inf)
```

## Arguments

- permuted_test_stats:

  a [`numeric()`](https://rdrr.io/r/base/numeric.html) vector

- observed_test_stat:

  a [`numeric()`](https://rdrr.io/r/base/numeric.html) with length 1

- n_permutations:

  how many permutations to use (`Inf` means use all in
  `permuted_test_stats`)

## Value

a [`numeric()`](https://rdrr.io/r/base/numeric.html)
