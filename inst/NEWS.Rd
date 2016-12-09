\name{NEWS}
\title{NEWS for lfactors}

\section{Changes in version 0.9.2}{
  \itemize{
    \item Now passes tests in interactive R as well as when run from within devtools::test
    \item as.integer and as.numeric now return potentially different values for all functions (not just when called in sparse.model.matrix). Essentially, the results of as.integer always start with 1 and go up by one while the results of as.numeric are the values that were used when creating the lfactor.
  }
}

\section{Changes in version 0.8.0}{
  \itemize{
    \item Fix bug in sparse.model.matrix. the basic issue is that, unlike model.matrix, sparse.model.matrix assumes that the result of as.integer() for a factor is ordered and starts at 1. This is worked around by sensing the function that calls as.integer and returning what sparse.model.matrix expects if the caller is fac2sparse, the specific function that makes this assumption
    \item add test for sparse.model.matrix that runs when the Matrix package is in the stack at the time of testing
    \item a function as.factor.lfactor is added but it only works when explicitly called
  }
}
\section{Changes in version 0.7.0}{
  \itemize{
    \item >= and <= now work with numeric or text inputs
    \item fixed a bug so that as.numeric now returns the initial numeric levels
    \item calls to setGeneric moved to be exclusively in all.R
    \item setMethods moved to the file where the function is defined
    \item all tests can now be run on CRAN
  }
}

\section{Changes in version 0.6.0}{
  \itemize{
    \item Fixed a bug in 'droplevels' that would set some levels to NA. This was making lfactors not work well with lm when some levels were unoccupied.
    \item GTE operator works with numeric comparison but still does not work with text comparison.
  }
}

\section{Changes in version 0.5.3}{
  \itemize{
    \item Added 'droplevels' function that allows 'droplevels' to work on an lfactor.
    \item Added 'relevel' function that returns an lfactor.
    \item lfactors can be updated to either a level or an llevel. e.g. month[4] <- 6 has the same effect as month[4] <- "June".
    \item in the [ function the drop argument now works as it does in factor.
    \item in the [ function, not using an 'i' argument now works correctly.
  }
}
