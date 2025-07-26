format_ml_f_EM <- function(
    ml_f_EM,
    n_s = dim(ml_f_EM)[1],
    subtype_order = seq_len(n_s)) {

  to_return <- ml_f_EM[subtype_order, drop = FALSE]
  dimnames(to_return) <-
    list(
      subtype = paste("Subtype", 1:n_s)
    )

  class(to_return) <- union("ml_f_EM", class(to_return))

  return(to_return)
}
