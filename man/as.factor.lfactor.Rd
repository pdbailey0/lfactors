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
Returns a \ifelse{latex}{\code{factor}}{\link[base]{factor}} from an \code{\link{lfactor}}.
}
\details{
Simply drops the numeric levels from the lfactor and returns a normal factor.
}
\seealso{
\ifelse{latex}{\code{as.factor}}{\code{\link[base:factor]{as.factor}}}
}

