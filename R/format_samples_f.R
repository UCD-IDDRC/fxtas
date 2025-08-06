format_samples_f <- function(
    samples_f,
    n_s = dim(samples_f)[1],
    subtype_order = seq_len(n_s)) {

  to_return <- samples_f[subtype_order, , drop = FALSE]
  dimnames(to_return) <-
    list(
      "subtype" = paste("Subtype", 1:n_s),
      iteration = NULL
    )

  class(to_return) <- union("samples_f", class(to_return))

  return(to_return)
}
