\name{sfl2sl}
\alias{sfl2sl}
\alias{sfl2statslist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Convert an sformlist object to a statslist object}
\description{
Converts an sformlist object to a statslist object, which is compatible with \code{rem()} in Butts's relevent package.
}
\usage{
sfl2sl(sformlist,exclude=NULL,eventlist=NULL)
sfl2statslist(sformlist,type=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sformlist}{an object of \code{class(sformlist)}}
  \item{exclude}{character vector, optional but useful if excluding events later. Must supply \code{eventlist} if non-null.}
  \item{eventlist}{optional, a two column matrix of events}
  \item{type}{integer indicating global or local statslist position. Defaults to 1.}
}
\details{
\code{sfl2sl} is an internal function used by \code{gen.sformlist} and should not normally be of any use to users.

\code{sfl2statslist}, however, will nicely convert any object returned by \code{gen.sformlist} or \code{glb.sformlist}
into a statslist object. This is useful for constructing s-form models without intercepts passed from \code{gen.intercepts}.
}
\author{Christopher Steven Marcum}
\seealso{\code{\link{gen.sformlist}}, \code{\link{slbind}}}
