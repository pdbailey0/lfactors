#' @method as.factor lfactor
#' @export
as.factor.lfactor <- function(x) {
  class(x) <- "factor"
  attr(x, "llevels") <- NULL
  x
}

methods::setGeneric("as.factor")
methods::setMethod("as.factor", methods::signature(x="lfactor"), as.factor.lfactor)
