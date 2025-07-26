format_ml_sequence_EM <- function(
    ml_sequence_EM,
    n_s = dim(ml_sequence_EM)[1],
    subtype_order = seq_len(n_s)) {

  ml_sequence_EM <- ml_sequence_EM[subtype_order, ]
  dimnames(ml_sequence_EM) <-
    list(
      subtype = paste("Subtype", 1:n_s),
      position = NULL
    )
  return(ml_sequence_EM)
}
