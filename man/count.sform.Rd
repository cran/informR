\name{count.sform}
\alias{count.sform}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Count Sform Instances}
\description{Counts and prints instances of an sform in a statslist.}
\usage{
count.sform(evls, sform, new.name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{evls}{An eventlist with eventlist attribute ``char'', as well as element ``event.key''.}
  \item{sform}{An sform regular expression using the \code{evls$event.key[,1]} uids.}
  \item{new.name}{Logical. Should count.sform guess at a descriptive name for the sform?. Default is TRUE.}
}

\value{
A list containing:
  \item{list}{A list of length \code{length(evls$eventlist)}, each numeric element of which is a count of the instances of the sform in the respective eventlist.}
}
\author{Christopher Steven Marcum}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)

sform<-"ab"
count.sform(evls,sform)
count.sform(evls,sform)$Bill

#Compare with
count.sform(evls,sform,new.name=FALSE)
}
