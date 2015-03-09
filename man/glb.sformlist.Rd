\name{glb.sformlist}
\alias{glb.sformlist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate a list of global S-form sequence statistics.}
\description{
Generates a list of S-form sequence statistics constructed by pooling multiple sform regular expressions into single statistics. Output is not used directly but is passed to other methods.
}
\usage{
glb.sformlist(evl, sforms, new.names, dichot, cond=FALSE, interval=FALSE, warn=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{evl}{An eventlist passed from \code{gen.evl()}}
  \item{sforms}{A list of character strings of S-form regular expressions grouped by a common attribute. See details.}
  \item{new.names}{A character string equal to the length of sforms ideally representing the common attributes of each pooled set of sforms.}
  \item{dichot}{Logical. Should the resulting statistics be dichotomized? Defaults to TRUE. See details.}
  \item{cond}{Logical. Should the prefix be dropped from the resulting statistics? Defaults to FALSE.}
  \item{interval}{Logical. Pass interval flag to gen.sformlits? Defaults to FALSE.}
  \item{warn}{Logical. Should warnings be issued? Defaults to TRUE.}
}
\details{
As with \code{gen.sformlist()}, regular expressions in \code{sforms} must adhere to PERL standards and, at this time, must make use of the alphabetic \code{evl$event.key} values in an eventlist object.

If \code{dichot} is set to FALSE then the components of the global sform that overlap will result in statistics that have been multiplied by a scalar equal to the number of overlaps. For example, in a situation where a global s-form is composed of the following terms: \code{c("aab","aac")}, any event ``a'' that occurs in an eventlist will have a corresponding value of 2 in the respective ``a'' column of the resulting statslist. In general, this is not the desired output and defaults to dichotomous statistics.

To generate S-form statistics that condition out the prefix set \code{cond=TRUE}. This will result in statistics of the form "(aa)b" or the likelihood of "b" given that "aa" occurred; thus, only the hazard of "b" is affected. This is useful when only the suffix event is of interest. When elements of each S-form are "paired," such as interval likelihood cases where each spell class can be characterized as having ``starting'' and ``stopping'' elements, setting \code{interval=TRUE} will result in two statistics per s-form: one that models the hazard of starting the suffix spell and one that models the duration of the suffix spell. In the general case, this is equivalent to a model with terms for "(ab)c" and "(ab)cd", respectively.

The \code{interval} parameter is a placeholder for future functionality. It currently passes the flag to \code{gen.sformlist()} and then fails to return what you think it should return.
}
\value{
A list containing idXevent, iXj matrices of sform sequence statistics.
}
\note{
A notice will be issued if special regex characters are found in any sform vector. 
}
\note{This routine will complain about poorly formed regular expressions.}
\note{The \code{cond} parameter affects all S-forms in \code{sform}.} 
\note{S-form regular expressions that contain repitition or divergence ("+" or "|") flags are not allowed when \code{cond=TRUE}. See the example in \code{help("gen.sformlist")} for how to do this manually.}
\author{Christopher Steven Marcum}
\seealso{\code{\link{gen.sform}},\code{\link{gen.sformlist}},\code{\link{sfl2sl}}}
\examples{
example(gen.sformlist)
x<-list(c("aa","bb","cc"),c("ba","ca"))
tb1<-glb.sformlist(eventlist,sforms=x,new.names=c("inertia","afollows"))
rem(eventlist$eventlist,slbind(tb1,alpha.ints))
}
