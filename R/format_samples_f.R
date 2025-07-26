format_samples_f <- function(samples_f,
                             subtype_order = dim(samples_f)[1]) {

  to_return <- samples_f[subtype_order, , drop = FALSE]
  dimnames(to_return) <-
    list(
      subtype = paste("Subtype", seq_along(subtype_order)),
      iteration = NULL
    )

  class(samples_f) <- union("samples_f", class(samples_f))

  return(to_return)
}
