\name{gen.sformlist}
\alias{gen.sformlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate a list of S-form sequence statistics.}
\description{
Generates a list of S-form sequence statistics based on sform regular expressions. Output is not used directly but is passed to other methods.
}
\usage{
gen.sformlist(evl, sforms, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{evl}{An eventlist passed from \code{gen.evl()}}
  \item{sforms}{A character string of S-form regular expressions representing the sequence statistics.}
  \item{\dots}{Additional arguments to pass to \code{\link{gen.sform}}}
}
\details{
Regular expressions must adhere to PERL standards and, at this time, must make use of the alphabetic \code{evl$event.key} values in an eventlist object.  Two special regex operators are permitted in S-form expressions: the ``|'' (OR operator) and the ``+'' (AND operator). In S-form expressions, the OR operator is used to differentiate between two possible event paths and the AND operator is used to indicate persistence of the last event.

Useful expressions include:
\tabular{rll}{
[,1] \tab aa \tab inertial term:
S-form of the type 
``event a predicts event a'' \cr \cr
[,2] \tab ab \tab basic digram transition term: 
S-form of the type 
``event a predicts event b'' \cr \cr
[,3] \tab a+b \tab transition term with persistence: 
S-form of the type 
``some series of events a predicts event b'' \cr \cr
[,4] \tab abc \tab basic trigram term: 
S-form of the of the type 
``event a followed by event b predicts event c'' \cr \cr
[,5] \tab aab \tab tuples term: 
S-form of the of the type
 ``event a followed by event a predicts event c'' \cr \cr
[,6] \tab (a|b)c \tab complex term with divergence: 
S-form of the of the type
 ``event a OR event b predicts event c'' \cr \cr
[,7] \tab (a|b+d)c \tab complex term with divergence and persistence: 
S-form of the of the type
 ``event a predicts event c OR some series of events b followed
by event d predicts event c''
}

There may be more than one way to form an S-form expression. For example, aa is equivalent to a+a; however, the former is preferred because the search methods used to update the sufficient statistics matrix are much faster in that case. This is also important to note because the informR package does not check for affine collinearity between the sufficient statistics (i.e., as would be the case in \code{gen.sformlist(evl, c("aa","a+a","aaa"))}.
}
\value{
A list containing idXevent, iXj matrices of sform sequence statistics.
}
\note{
A notice will be issued if special regex characters are found in the sform vector. 
}
\note{This routine will complain about poorly formed regular expressions.}
\author{Christopher Steven Marcum}
\seealso{\code{\link{gen.sform}},\code{\link{sfl2sl}}}
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
}
