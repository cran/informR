\name{gen.id}
\alias{gen.id}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate Unique Id's for Events}
\description{
Internal function for generating unique single character id's for each unique event in an eventlist. May be useful for a user to call if, for some reason, event.key is lost from the eventlist.
}
\usage{
gen.id(rawevents, print = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rawevents}{a character string of events}
  \item{print}{logical, print the single character codes corresponding to the unique event values to stdout. Defaults to TRUE.}
}
\details{
Currently, the rawevents string must not contain more than 52 unique event types (i.e., 2Xlength(a:z)}
\value{
A character string of single character identifiers for each unique event.}
\author{Christopher Steven Marcum}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),5))
actors<-rep(c("Jim","Bill","Pete"),10)
idevents<-gen.id(rawevents)
idevents
}
