# Plot permutation test results

Plot permutation test results

## Usage

``` r
plot_permutation_results(permuted_test_stats, observed_test_stat)
```

## Arguments

- permuted_test_stats:

  a [`numeric()`](https://rdrr.io/r/base/numeric.html) vector

- observed_test_stat:

  a [`numeric()`](https://rdrr.io/r/base/numeric.html) with length 1

## Value

an object of class `"permutation-test-results"`, which extends
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html)
by adding a `p-value` attribute.
