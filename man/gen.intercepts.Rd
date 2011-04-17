\name{gen.intercepts}
\alias{gen.intercepts}
\alias{gen.baserates}
\title{Generate Baserate Statistics}
\description{
Generates baserate statistics in statslist form for direct input into \code{rem()} in Butts's relevent R package.
}
\usage{
gen.intercepts(evl, basecat=NULL, type=1, contr=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{evl}{An eventlist. Possibly passed from \code{gen.evl()}}
  \item{basecat}{A string indicating which event to treat as the baseline group. Default is NULL, which uses the first event in \code{evl$event.key}.}
  \item{type}{An integer indicating the location of the statistics in the statslist. 1 for global, 2 for local. Default is global.}
  \item{contr}{Logical. Should the routine use SAS-like contrasts to generate the statistics? Defaults to true (which is faster than the alternative).}
}
\value{
A list containing:
  \item{list}{An i,j,k array consisting of the i'th event's j by k identity contrast matrix.}
}

\author{Christopher Steven Marcum}

\seealso{\code{\link{slbind}},\code{\link{gen.id}}}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),5))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-gen.evl(cbind(rawevents,actors))
baserates<-gen.intercepts(eventlist)
baserates[[1]][[1]][1,,]

#Compare with:
baserates<-gen.intercepts(eventlist,contr=FALSE)
baserates[[1]][[1]][1,,]
}

