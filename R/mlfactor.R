# Rd in man, not roxygen
#' @export
mlfactor <- function(x, table, nomatch=NA_integer_, incomparables=NULL) {
  if(inherits(x, "lfactor")) {
  	m1 <- match(x=as.character(x), table=as.character(table), nomatch=nomatch, incomparables=incomparables)
  	m2 <- match(x=as.character(switchllevels(x)), table=as.character(table), nomatch=nomatch, incomparables=incomparables)
  } else {
  	m1 <- match(x=as.character(x), table=as.character(table), nomatch=nomatch, incomparables=incomparables)
  	m2 <- match(x=as.character(x), table=as.character(switchllevels(table)), nomatch=nomatch, incomparables=incomparables)
  }
	# start with m1
	mm <- m1
	# when m2 found something and m1 did not, use the value from m2
	mm[(!m2 %in% nomatch) & (m1 %in% nomatch)] <- m2[(!m2 %in% nomatch) & (m1 %in% nomatch)]
	# when both find someting, use the smaller
	mm[(!m2 %in% nomatch) & (!m1 %in% nomatch)] <- pmin(m2[(!m2 %in% nomatch) & (!m1 %in% nomatch)], m1[(!m2 %in% nomatch) & (!m1 %in% nomatch)])
  mm
}

methods::setGeneric("match")
setMethod("match", signature(x="lfactor"), mlfactor)
setMethod("match", signature(table="lfactor"), mlfactor)
setMethod("match", signature(x="lfactor", table="lfactor"), mlfactor) # prevents warning
