format_ml_f_EM <- function(
    ml_f_EM,
    subtype_order = seq_len(dim(ml_f_EM)[1])) {

  to_return <- ml_f_EM[subtype_order, drop = FALSE]
  dimnames(to_return) <-
    list(
      subtype = paste("Subtype", subtype_order)
    )

  class(to_return) <- union("ml_f_EM", class(to_return))

  return(to_return)
}
