#' @title lfactors
#'
#' @description \code{lfactor} creates a factor that can be compared to its levels or labels.
#'
#' @param x a numeric or character vector of data. Levels of x can be taken
#'          either from levels or labels.
#' @param levels a numeric vector of levels in x. Note that, unlike
#'               \code{factor}, these must be numeric. 
#' @param labels a vector of labels for the levels. This vector must be either
#'               characters that cannot be cast as numeric or characters that
#'               are equal to the level, of the same index,
#'               when cast as numeric.
#' @param \dots arguments passed to \ifelse{latex}{\code{factor}}{\code{\link[base]{factor}}}
#'
#' @details 
#' An lfactor can be compared to the levels or the labels
#' (see the Examples). Because of that,
#' the levels must be numeric, and the labels must be either not castable
#' as numeric or equal to
#' the levels of the same index when cast as numeric.
#' 
#' An lfactor is, essentially, a factor that remembers the levels
#' as well as the labels argument.
#' Note that all of the arguments are passed to
#' \ifelse{latex}{\code{factor}}{\code{\link[base]{factor}}}. Because lfactor imposes
#' some additional constraints on the types of levels and labels
#' and stores additional information,
#' an lfactor uses more memory than a factor---because it stores both
#' labels and levels---and is,
#' in some ways, more limited than a factor.
#' 
#' @return
#' An object of class lfactor that also implements \ifelse{latex}{\code{factor}}{\code{\link[base]{factor}}}
#'
#' @seealso \ifelse{latex}{\code{factor}}{\code{\link[base]{factor}}}
#' 
#' @example man/examples/lfactor.R
#' 
#' @export
lfactor <- function(x, levels, labels=levels, ...) {
  if(! class(levels) %in% c("integer", "numeric") ) {
    stop(paste0("The ",sQuote("levels"), " argument must be of class integer or numeric."))
  }
  goodlabs <- rep(FALSE, length(labels)) 
  suppressWarnings(nlabs <- as.numeric(labels))
  goodlabs[is.na(nlabs)] <- TRUE
  goodlabs[!is.na(nlabs) & nlabs == levels] <- TRUE
  if( sum(goodlabs) < length(labels)) {
    stop(paste0("The ",sQuote("levels"), " and ", sQuote("labels"), " arguments must either be identical or the labels must not be numbers."))
  }
  if(sum(x %in% labels) > 0) {
    for(lab in labels[labels %in% x]) {
      x[x%in%lab] <- levels[labels==lab]
    }
  }
  res <- factor(x, levels=levels, labels=labels, ...)
  attr(res,"llevels") <- levels
  class(res) <- c("lfactor", "factor")
  res
}

