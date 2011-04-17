\name{sfl2sl}
\alias{sfl2sl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert an sformlist object to a stastlist object}
\description{
Converts an sformlist object to a statslist object, which is compatible with \code{rem()} in Butts's relevent package.
}
\usage{
sfl2sl(sformlist,exclude=NULL,eventlist=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sformlist}{an object of \code{class(sformlist)}}
  \item{exclude}{character vector, optional but useful if excluding events later. Must supply \code{eventlist} if non-null.}
  \item{eventlist}{optional, a two column matrix of events}
}
\author{Christopher Steven Marcum}
\seealso{\code{\link{gen.sformlist}}, \code{\link{slbind}}}
