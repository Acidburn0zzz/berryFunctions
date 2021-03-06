\name{cie}
\alias{cie}
\title{extended confidence interval}
\description{as in \code{\link{ci}},calculates the confidence interval around mean using \code{\link{t.test}}, 
but also returns mean, sd, CV (Coefficient of Variation), 2 given Quantiles, min and max }
\usage{cie(dat, lev=0.95, digits=3, p1=0.05, p2=0.95)}
\arguments{
  \item{dat}{vector with the data to use.}
  \item{lev}{numeric. confidence level. DEFAULT: 0.95}
  \item{digits}{integer. Number of digits rounded to in output. DEFAULT: 3}
  \item{p1}{numeric. lower percentile passed to \code{\link{quantile}}. DEFAULT: 0.05}
  \item{p2}{numeric. upper percentile passed to \code{\link{quantile}}. DEFAULT: 0.95}
}
\value{A dataframe with the lower and upper confidence interval, as well as the level used, and mean, sd, CV (Coefficient of Variation), 2 given Quantiles, min and max}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, 2010}
\note{Since the discovery of \code{\link{summary}}, I don't really use this anymore.}
\seealso{\code{\link{ci}}, \code{\link{t.test}}, \code{\link{summary}}}
\examples{
yourdata <- c(5:8,3,14)
cie(yourdata)          # confidence interval with the default confidence level (95%)
cie(yourdata, lev=0.99)# specified with a different confidence level 
cie(yourdata, 0.99, 4) # returns 4 decimal places
cie(yourdata, digits=2)# rounds to 2 decimal places with default level
cie                    # shows the function itself
}
\keyword{htest}
