calc_alpha_mult <- function(plot_dataset, max_alpha, min_alpha) {
  max_order <- max(plot_dataset$Order)
  alpha_mult <- ((max_alpha - min_alpha) / (max_order - 1))
  return(alpha_mult)
}
