# Plot cross-validated per-fold log-likelihood distributions

Plot cross-validated per-fold log-likelihood distributions

## Usage

``` r
plot_cv_loglik(cv_loglik, y_text_size = 8)
```

## Arguments

- cv_loglik:

  [`matrix()`](https://rdrr.io/r/base/matrix.html) with rows
  corresponding to cross-validation folds and columns corresponding to
  number of latent subgroups

- y_text_size:

  [integer](https://rdrr.io/r/base/integer.html)

## Value

a
[`ggplot2::ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html)

## Examples

``` r
cvic_sim_data$loglike_matrix |> plot_cv_loglik()

```
