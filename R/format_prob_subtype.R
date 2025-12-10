format_prob_subtype <- function(
    prob_subtype,
    n_s = dim(prob_subtype)[2],
    subtype_order = seq_len(n_s)) {

  to_return <- prob_subtype[ , subtype_order , drop = FALSE]
  dimnames(to_return) <-
    list(
      ID = NULL,
      subtype = paste("Subtype", 1:n_s)
    )

  class(to_return) <- union("prob_subtype", class(to_return))

  return(to_return)
}
