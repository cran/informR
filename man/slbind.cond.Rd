\name{slbind.cond}
\alias{slbind.cond}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Add ActorXEvent Conditional or Interaction Variables to a Statslist Array}
\description{
Combines a single actor-level attribute with sufficient statistics from a statslist array using a wrapper for \code{abind()} in the abind package.
}
\usage{
slbind.cond(intvar, statslist, var.suffix, sl.ind=NULL,who.evs=NULL,type = 1,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{intvar}{An actor-level numeric variable. See Details.}
  \item{statslist}{A statslist object, possibly passed from \code{\link{gen.intercepts}}.}
  \item{var.suffix}{A character string naming the new variable(s).}
  \item{sl.ind}{A numeric vector containing the statslist column indices to be interacted with intvar. Defaults to all columns. See Details.}
  \item{who.evs}{If type=2, a numeric vector indexing where to apply the interaction. Optional.}
  \item{type}{Indicates where the combining is going to occur in statslist. 1 for global, 2 for local.}
  \item{...}{Additional methods passed to \code{abind()}.}
}
\details{
For global statistics, \code{length(intvar)==length(statslist)} must be true. Because current functionality allows for only single vectors, the user must iterate over all levels of factors with more than two levels. Thus, this is truly a _single variable_ function and care must be taken.

The \code{sl.ind} parameter should be carefully specified as improper interactions can result in over-identified or unidentifiable models.
}
\author{Christopher Steven Marcum}
\note{\code{slbind.cond} can accept \code{\link{abind}} arguments.
}
\seealso{\code{\link{slbind}}, \code{\link{abind}},\code{\link{slbind.cov}}}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)
beta.ints<-gen.intercepts(eventlist)


statslist.new<-slbind.cond(intvar=c(1,0,0),beta.ints,var.suffix="Jim")
statslist.new[[1]][[1]][1,,]
statslist.new[[2]][[1]][1,,]
statslist.new[[3]][[1]][1,,]
}
