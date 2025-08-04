\dontrun{
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
}
