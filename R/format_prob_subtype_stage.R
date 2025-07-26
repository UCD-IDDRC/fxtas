format_prob_subtype_stage <- function(
    prob_subtype_stage,
    n_subtypes = dim(prob_subtype_stage)[3],
    subtype_order = seq_len(n_subtypes)) {

  n_stages <- dim(prob_subtype_stage)[2] - 1
  dimnames(prob_subtype_stage) <- list(
     ID = NULL,
     Stage = paste("Stage", 0:n_stages),
     subtype = paste("Subtype", subtype_order)
  )

  return(prob_subtype_stage)

}
