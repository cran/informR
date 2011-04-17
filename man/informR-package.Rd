\name{informR-package}
\alias{informR-package}
\alias{informR}
\docType{package}
\title{R Tools for Creating Sequence Statistics}
\description{
Tools for creating sequence statistics for Butts's egocentric relational event model fitting software in the \code{library(relevent)} R package.
}
\details{
\tabular{ll}{
Package: \tab informR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-04-17\cr
License: \tab GPL 2.0 or greater\cr
LazyLoad: \tab yes\cr
}
Use this package to create variables and assemble statslists and eventlists from regular expressions for egocentric relational event model fitting using Butts's \code{library(relevent)} package.
}
\author{
Author and Maintainer:Christopher Steven Marcum <cmarcum@uci.edu>
}
\keyword{ package }
\seealso{
\link[relevent]{rem}
}
\examples{
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)

#See event-type alphabetic token codes
eventlist$event.key

alpha.ints<-gen.intercepts(eventlist,basecat="ran")

#Create some inertial s-form statistics and fit the models
beta.sforms<-gen.sformlist(eventlist,c("aa","bb","cc","dd"))

#Combine s-form matrices with intercepts
beta.ints<-slbind(beta.sforms,alpha.ints,new.names=TRUE,event.key=eventlist$event.key)
fitalpha.rem<-rem(eventlist=eventlist$eventlist,statslist=alpha.ints,estimator="BPM")
fitbeta.rem<-rem(eventlist=eventlist$eventlist,statslist=beta.ints,estimator="BPM")
summary(fitalpha.rem)
summary(fitbeta.rem)

for(i in c("aa","bb","cc","dd")) count.sform(eventlist,i)
}
