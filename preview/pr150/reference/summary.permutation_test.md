# Summary method for `permutation_test` objects

Summary method for `permutation_test` objects

## Usage

``` r
# S3 method for class 'permutation_test'
summary(object, N, digits = 2, ...)
```

## Arguments

- object:

  a `permutation_test` object (from
  [`permutation_test()`](https:/UCD-IDDRC.github.io/fxtas/preview/pr150/reference/permutation_test.md))

- N:

  sample size of underlying data

- digits:

  how many digits to round the test statistic

- ...:

  unused

## Value

a [glue::glue](https://glue.tidyverse.org/reference/glue.html) string

## Examples

``` r
if (FALSE) { # \dontrun{
output_folder <-
  "output/output.fixed_CV-scid-no-subthres/"

permuted_test_stats_sex <- collect_permutation_test_stats(
  output_folder = output_folder,
  permuting_variables = "Gender"
)

observed_test_stat_sex <- get_observed_permutation_test_stat(
  output_folder,
  dataset_names = c("females", "males")
)

pval_sex_gp34_v1 <- permutation_test(
  observed_test_stat = observed_test_stat_sex,
  permuted_test_stats = permuted_test_stats_sex,
  n_permutations = n_permutations
)

summary(pval_sex_gp34_v1, N = 253)
} # }
```
