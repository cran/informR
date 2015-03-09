\name{gen.evl}
\alias{gen.evl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate numeric categories of events.}
\description{Generate numeric categories of events in an idXevent list.}
\usage{
gen.evl(eventlist, null.events=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{eventlist}{Either a two (2) or three (3) column matrix or data.frame. See Details.}
  \item{null.events}{A character vector of event values that should be treated as 0 in the eventlist. Default is NULL.}
}

\details{
For interval (or continuous) relational event models, \code{eventlist} must be a three column matrix where the first column indexes the events, the second column indexes the temporal information of when the event transpired, and the third column indexes an event history grouping factor (possibly, for instance, the name(s) of the actor(s)). For each unique value of the grouping factor, the corresponding events must be given in ascending temporal order. For ordinal (or discrete) relational event models, \code{eventlist} must be a two column matrix with the first column indexing the events and the second column indexing the event history grouping factor.
}

\value{
A list containing:
  \item{eventlist}{Vector of integers representing numeric codes for events. Has \code{attr(,"char")}, which represents the character representation of those values.}
  \item{event.key}{A key identifying the unique ids of each verbose event type.}
  \item{null.events}{\code{if(!is.null(null.events))}, a vector of null events.}
}
\author{Christopher Steven Marcum}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)
evls$eventlist$Bill
evls$event.key

#Compare with:
evls<-gen.evl(eventlist,null.events=c("ran","eat"))
evls$eventlist$Bill
evls$event.key
evls$null.events
}
