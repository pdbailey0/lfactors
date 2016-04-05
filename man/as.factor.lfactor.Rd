\name{as.factor.lfactor}
\alias{as.factor.lfactor}
\alias{as.factor,lfactor-method}
\title{factor from an lfactor}
\usage{
\method{as.factor}{lfactor}(x)
}
\arguments{
\item{x}{the lfactor to be coerced to a factor}
}
\description{
Returns an \code{\link[base]{factor}} from an \code{\link{lfactor}}.
}
\details{
simply drops the numeric levels from the lfactor and returns a normal factor.
}
\seealso{
\code{\link[base]{as.factor}}
}

