\name{glapply}
\alias{glapply}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Group Level Apply}
\description{
Apply a function on a variable over levels of an grouping factor. A wrapper for \code{split()} and is similar in functionality to \code{by()} but with more options for output.
}
\usage{
glapply(x, id, FUN, regroup = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{a string or numeric vector.}
  \item{id}{grouping factor with \code{length(x)}}
  \item{FUN}{Function to apply over \code{x}}
  \item{regroup}{logical, if TRUE returns result in the same structure as \code{x}, otherwise, returns a list of length \code{unique(id)}.}
  \item{\dots}{Additional arguments passed to FUN}
}
\author{Christopher Steven Marcum}
\seealso{\code{\link{split}},\code{\link{unsplit}},\code{\link{lapply}}}
\examples{
data(Indometh)
glapply(Indometh$conc,Indometh$Subject,FUN=mean)
x<-rep(sample(1:10),2)
id<-rep(letters[1:5],4)
glapply(x,id,FUN=function(x)sum((x-mean(x))^2),regroup=FALSE)
glapply(x,id,FUN=function(x)sum((x-mean(x))^2),regroup=TRUE)
#Compare with output produced by by()
by(x,id,function(x)sum((x-mean(x))^2))
}
