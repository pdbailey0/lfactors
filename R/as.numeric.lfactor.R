#' @method as.numeric lfactor
#' @export
as.numeric.lfactor <- function(x, ...) {
  as.numeric(as.character(switchllevels(x)))
}

#' @method as.integer lfactor
#' @export
as.integer.lfactor <- function(x, ...) {
  getCaller <- function() {
    sn <- sys.nframe()
    sc <- sys.calls()
    sc <- if(sn > 3) {
      sc <- deparse(sc[[sn-3]])
    } else {
      sc <- "interactive()"
    }
    sc <- strsplit(sc, "(", fixed=TRUE)[[1]][1]
    sc
  }
  caller <- getCaller()
  if(caller %in% c("fac2sparse")) {
    # deals with assumption in this function that all factors return like this
    return(as.integer(as.factor.lfactor(x)))
  }
  as.integer(as.character(switchllevels(x)))
}

#' @method as.double lfactor
#' @export
as.double.lfactor <- function(x, ...) {
  as.double(as.character(switchllevels(x)))
}

#setMethod("as.numeric", signature(x="lfactor"), as.numeric.lfactor)
#setMethod("as.integer", signature(x="lfactor"), as.numeric.lfactor)
#setMethod("as.double", signature(x="lfactor"), as.numeric.lfactor)

