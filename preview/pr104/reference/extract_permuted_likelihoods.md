# Extract permuted log-likelihoods from pickle files

Extract permuted log-likelihoods from pickle files

## Usage

``` r
extract_permuted_likelihoods(
  permuting_variables = "Gender",
  n_permutations = 1000,
  permutations = 1:n_permutations,
  output_folder,
  verbose = TRUE
)
```

## Arguments

- permuting_variables:

  which files were permuted

- n_permutations:

  how many permutations were performed

- permutations:

  which permutation seeds to extract

- output_folder:

  where to find the pickle files

- verbose:

  whether to print informative messages about progress

## Value

a named [`numeric()`](https://rdrr.io/r/base/numeric.html) vector of
log-likelihoods from permuted data
