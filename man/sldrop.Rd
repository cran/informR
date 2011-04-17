\name{sldrop}
\alias{sldrop}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Drop S-form Statistics or Covariates from a Statslist Array}
\description{Removes variables from a statslist.}
\usage{
sldrop(statslist, varname, type = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{statslist}{A statslist object, possibly passed from \code{\link{gen.intercepts}} or other methods}
  \item{varname}{A vector of variable names to remove from statslist. See details.}
  \item{type}{Indicates where the combining is going to occur in statslist. 1 for global, 2 for local.}
}
\details{
Removes the kth element(s) from the [i,j,k] statslist array based upon regex match of the k dimnames(statslist[[x]][[type]])[[3]].
}
\author{Christopher Steven Marcum}
\seealso{\code{\link{slbind}}, \code{\link{slbind.cov}}, \code{\link{abind}}}
\examples{

#Take example from slbind.cov
example(slbind.cov)
statslist.new<-slbind.cov(covar,beta.ints)
statslist.new[[1]][[1]][,1,]

#And removes the "smokes" variable
dimnames(statslist.new[[1]][[1]])[[3]]
statslist.old<-sldrop(statslist.new,"smokes")
dimnames(statslist.old[[1]][[1]])[[3]]
}
