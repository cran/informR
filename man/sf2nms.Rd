\name{sf2nms}
\alias{sf2nms}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Translate S-form Regular Expressions}
\description{Translates S-forms into verbose names by regex substitution using the event.key in an eventlist.}
\usage{
sf2nms(event.key, sform)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{event.key}{A two column matrix, possibly passed from \code{evls$event.key}}
  \item{sform}{An S-form regular expression using the \code{evls$event.key[,1]} uids.}
}

\value{
A list containing:
  \item{character}{A ``translation'' by substitution of the sform in unique id form to its event type representation}
}
\author{Christopher Steven Marcum}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),100))
actors<-rep(c("Jim","Bill","Pete"),10)
eventlist<-cbind(rawevents,actors)
evls<-gen.evl(eventlist)

sform<-"ab"
sf2nms(evls$event.key,sform)
}
