add_class <- function(object, newclass) {
  class(object) <- union(newclass, class(object))
  return(object)
}
