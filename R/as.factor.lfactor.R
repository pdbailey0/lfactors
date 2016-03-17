#' @method as.factor lfactor
#' @export
as.factor.lfactor <- function(x) {
  class(x) <- "factor"
  attr(x, "llevels") <- NULL
  x
}

