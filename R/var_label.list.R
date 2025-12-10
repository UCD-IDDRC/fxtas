#' #' @export
#' #' @importFrom labelled var_label
#' labelled::var_label
#'
#' #' extract variable labels from list
#' #' @description wrapper for [labelled::var_label.data.frame()]
#' #' @inheritDotParams labelled::var_label.data.frame
#' #' @export
#' var_label.list <- function(...) labelled::var_label.data.frame(...)
