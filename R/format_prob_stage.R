format_prob_stage <- function(prob_stage) {
  n_stages <- dim(prob_stage)[2] - 1
  dimnames(prob_stage) <- list(
     ID = NULL,
     Stage = paste("Stage", 0:n_stages)
  )

  return(prob_stage)
}
