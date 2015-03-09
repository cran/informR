\name{regmat.ind}
\alias{regmat.ind}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Regular Expresstion Matrix Index}
\description{
Internal function for generating a matrix of regular expression position matches, usually mapped to a vector expansion of the input string.
}
\usage{
regmat.ind(reg,evl,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{reg}{character, The regular expression.}
  \item{evl}{eventlist, The eventlist on which regex in \code{reg} is to be performed.}
  \item{...}{additional parameters to pass to \code{gregexpr()}.}
}
\value{
A three column matrix of integers.}
\author{Christopher Steven Marcum}
