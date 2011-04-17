\name{slbind.cov}
\alias{slbind.cov}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Add Covariates to a Statslist Array}
\description{
Combines scalars and vectors to statslist arrays using a wrapper for \code{abind()} in the abind package.
}
\usage{
slbind.cov(covar, statslist, type = 1,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{covar}{A list of lists containing the covariates, see details}
  \item{statslist}{A statslist object, possibly passed from \code{\link{gen.intercepts}}}
  \item{type}{Indicates where the combining is going to occur in statslist. 1 for global, 2 for local.}
  \item{...}{Additional methods passed to \code{abind()}.}
}
\details{
The length AND actor-order of the covar list must equal that of the statslist. Currently, no check is made to ensure that the actor-order is maintained, though an object length error will be returned in many faulty cases. Also, note that the number of covariates in each element of covar (i.e., for each actor) should be the same for proper model identification (also not currently checked).

Actor-level covariates are passed as single values and event-level covariates are passed as vectors. That is, each sub-element (covariate) of the covar list must either be a scalar or a vector with length equal to \code{length(eventlist$eventlist$actor)}.

If \code{names(covar$actor)} (for any and each actor) is NULL, then \code{slbind.cov()} will generate names using the \code{make.names=TRUE} parameter, as discussed in the \code{?abind} documentation.
}
\author{Christopher Steven Marcum}
\note{\code{slbind.cov} can accept \code{\link{abind}} arguments.
}
\seealso{\code{\link{slbind}}, \code{\link{abind}}}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)
beta.ints<-gen.intercepts(eventlist)

##Make up some covariates
covar<-list()
covar$Bill$rate<-sort(rexp(length(eventlist$eventlist$Bill)))
covar$Bill$smokes<-1
covar$Jim$rate<-sort(rexp(length(eventlist$eventlist$Jim)))
covar$Jim$smokes<-0
covar$Pete$rate<-sort(rexp(length(eventlist$eventlist$Pete)))
covar$Pete$smokes<-0

statslist.new<-slbind.cov(covar,beta.ints)
statslist.new[[1]][[1]][,1,]
}
