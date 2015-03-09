\name{gen.sformlist}
\alias{gen.sformlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate a list of S-form sequence statistics.}
\description{
Generates a list of S-form sequence statistics based on sform regular expressions. Output is not used directly but is passed to other methods.
}
\usage{
gen.sformlist(evl, sforms,cond=FALSE, interval=FALSE, warn=TRUE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{evl}{An eventlist passed from \code{gen.evl()}}
  \item{sforms}{A character string of S-form regular expressions representing the sequence statistics.}
  \item{cond}{Should the resulting statistics condition out the prefix? Defaults to FALSE.}
  \item{interval}{When cond=TRUE, are elements of sforms paired as start-stop terms?. Defaults to FALSE.}
  \item{warn}{Should warnings be issued? Defaults to TRUE.}
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

To generate S-form statistics that condition out the prefix set \code{cond=TRUE}. This will result in statistics of the form "(aa)b" or the likelihood of "b" given that "aa" occurred; thus, only the hazard of "b" is affected. This is useful when only the suffix event is of interest. When elements of each S-form are "paired," such as interval likelihood cases where each spell class can be characterized as having ``starting'' and ``stopping'' elements, setting \code{interval=TRUE} will result in two statistics per s-form: one that models the hazard of starting the suffix spell and one that models the duration of the suffix spell. In the general case, this is equivalent to a model with terms for "(ab)c" and "(ab)cd", respectively. 
}
\value{
A list containing idXevent, iXj matrices of sform sequence statistics.
}
\note{
A notice will be issued if special regex characters are found in the sform vector. 
}
\note{This routine will complain about poorly formed regular expressions.}
\note{The \code{cond} parameter affects all S-forms in \code{sform}.} 
\note{S-form regular expressions that contain repitition or divergence ("+" or "|") flags are not allowed when \code{cond=TRUE}. See the example for how to do this manually.}
\author{Christopher Steven Marcum}
\seealso{\code{\link{gen.sform}},\code{\link{sfl2sl}},\code{\link{glb.sformlist}}}
\examples{
set.seed(57391)
rawevents<-sample(rep(c("ran","eat","stay","eat","ran","play"),50))
actors<-rep(c("Jim","Bill","Pete"),100)
evmat<-cbind(rawevents,actors)
eventlist<-gen.evl(evmat)

#See event-type alphabetic token codes
eventlist$event.key

alpha.ints<-gen.intercepts(eventlist,basecat="ran")

#Create some inertial s-form statistics and fit the models
beta.sforms<-gen.sformlist(eventlist,c("aa","bb","cc","dd"))

#Condition out the effects of the prefix:
gamma.sforms<-gen.sformlist(eventlist,c("aab","abb","acc","add"),cond=TRUE)

#Manual example of the above
sforms1<-c("aab","abb","acc","add")
sforms2<-sapply(sforms1,function(x) substr(x,1,nchar(x)-1))

sforms1.sf<-gen.sformlist(eventlist, sforms1)
sforms2.sf<-gen.sformlist(eventlist, sforms2)

for(i in 1:length(sforms1.sf)){
   for(j in 1: dim(sforms1.sf[[1]])[[3]]){
      sforms1.sf[[i]][,,j]<-abs(sforms1.sf[[i]][,,j]-sforms2.sf[[i]][,,j])
   }
}

#Note the difference:
gamma.sforms2<-gen.sformlist(eventlist,c("aab","abb","acc","add"))
gamma.sforms2[[1]][75:85,,1]
gamma.sforms[[1]][75:85,,1]
}
