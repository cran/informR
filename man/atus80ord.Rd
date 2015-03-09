\name{atus80ord}
\alias{atus80ord}
\docType{data}
\title{
Ordinal Events Subset of the American Time Use Survey
}
\description{
Event histories from respondents over the age of 80 in the pooled 2003--2008 American Time Use Survey.
}
\usage{data(atus80ord)}
\format{
  A data frame with 62,352 observations on the following 3 variables.
  \describe{
    \item{\code{Activities}}{Type of activity spell. See details.}
    \item{\code{TUCASEID}}{Respondent unique identification number.}
    \item{\code{SEX}}{Sex of respondent. 1=Males.}
  }
}
\details{
Each activity was recoded into a general activity class with 14 possible values (including ``missing'' as NA).
}
\source{
Bureau of Labor Statistics. The American Time Use Survey. Available online at: \url{http://www.bls.gov/tus/}.
}
\examples{
data(atus80ord)
#Activity Spell Frequencies by Sex
table(atus80ord$Activities,atus80ord$SEX)
}
\keyword{datasets}
