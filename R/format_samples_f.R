format_samples_f <- function(
    samples_f,
    subtype_order = seq_len(dim(samples_f)[1])) {

  to_return <- samples_f[subtype_order, , drop = FALSE]
  dimnames(to_return) <-
    list(
      subtype = paste("Subtype", subtype_order),
      iteration = NULL
    )

  class(to_return) <- union("samples_f", class(to_return))

  return(to_return)
}
