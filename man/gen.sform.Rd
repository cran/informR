\name{gen.sform}
\alias{gen.sform}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generates Sform Statistics from Event Sequences}
\description{
Internal function for generating sequence statistics based on limited regular expressions.
}
\usage{
gen.sform(a, sform, olev = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{A character vector of events, possibly passed from \code{\link{gen.id}}. Must have \code{attr(a,"a.uid")}.}
  \item{sform}{A regular expression representing the sequence statistic, see details}
  \item{olev}{a character vector, see details.}
}
\details{
This function is typically not called by the end user. Regular expressions must adhere to PERL standards and, at this time, must make use of the alphabetic event.key values in an eventlist object.

The parameter \code{olev} is a placeholder for future functionality, however can currently be used to truncate valid event types not found in the null.events values in an eventlist object. This parameter will rarely ever be non-null.
}
\value{
A list of \code{length(a)} containing single row matrices of sufficient statistics for matches/non-matches of the S-form.
}

\author{Christopher Steven Marcum}
\note{Currently, \code{a} must consist of single character ids. This is not checked.
}
