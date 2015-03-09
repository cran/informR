\name{atus80int}
\alias{atus80int}
\docType{data}
\title{
Interval Events Subset of the American Time Use Survey
}
\description{
Event histories from respondents over the age of 80 in the pooled 2003--2008 American Time Use Survey.
}
\usage{data(atus80int)}
\format{
  A data frame with 124,704 observations on the following 4 variables:
  \describe{
    \item{\code{Events}}{Type of event. See details.}
    \item{\code{Time}}{Cumulative time that an event occurred. See details.}
    \item{\code{TUCASEID}}{Respondent unique identification number.}
    \item{\code{SEX}}{Sex of respondent. 1=Males.}
  }
}
\details{
Each general sequential activity spell in the American Time Use Survey for respondents aged 80 and over was split into ``starting'' and ``stopping'' events.

The timing variable marks the instantaneous ``time'' of event occurrence in minutes beginning at time 0 and ending at time t (which is usually 1400). Because simultaneous events are not allowed one thousandth of a minute is added to the starting time of each activity spell after the first spell.
}
\source{
Bureau of Labor Statistics. The American Time Use Survey. Available online at: \url{http://www.bls.gov/tus/}.
}
\examples{
data(atus80int)
#Types of Events
unique(atus80int$Events)
}
\keyword{datasets}
