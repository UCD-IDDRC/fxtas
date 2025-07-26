format_prob_subtype <- function(
    prob_subtype,
    subtype_order = seq_len(dim(prob_subtype)[2])) {

  to_return <- prob_subtype[ , subtype_order , drop = FALSE]
  dimnames(to_return) <-
    list(
      ID = NULL,
      subtype = paste("Subtype", subtype_order)
    )

  class(to_return) <- union("prob_subtype", class(to_return))

  return(to_return)
}
