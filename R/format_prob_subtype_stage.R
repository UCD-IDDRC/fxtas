format_prob_subtype_stage <- function(
    prob_subtype_stage,
    n_subtypes = dim(prob_subtype_stage)[3],
    subtype_order = seq_len(n_subtypes)) {

  prob_subtype_stage <- prob_subtype_stage[ , , subtype_order, drop = FALSE]
  n_stages <- dim(prob_subtype_stage)[2] - 1
  dimnames(prob_subtype_stage) <- list(
     ID = NULL,
     Stage = paste("Stage", 0:n_stages),
     subtype = paste("Subtype", 1:n_subtypes)
  )

  return(prob_subtype_stage)

}
