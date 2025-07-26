format_ml_sequence_EM <- function(
    ml_sequence_EM,
    n_s = dim(ml_sequence_EM)[1],
    subtype_order = seq_len(n_s)) {

  dimnames(ml_sequence_EM) <-
    list(
      subtype = paste("Subtype", subtype_order),
      position = NULL
    )
  return(ml_sequence_EM)
}
