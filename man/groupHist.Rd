\name{groupHist}
\alias{groupHist}
\title{Histogramm for classes}
\description{improvement of \code{tapply(x, g, hist)} with x and g taken from a data.frame}
\usage{groupHist(d, x, g, xlab="", ylab="", las=1, main=NULL, unit=NA, ... )}
\arguments{
  \item{d}{data.frame object name}
  \item{x}{column name of variable of interest}
  \item{g}{column name of groups (\code{INDEX in \link{tapply}, f in \link{split}})}
  \item{xlab, ylab}{axis labels. DEFAULT: ""}
  \item{las}{LabelAxisStyle, see \code{\link{par}}. DEFAULT: 1, means numbers on y-axis upright}
  \item{main}{Main title, internal default based on \code{d, x, unit} and \code{g}. DEFAULT: NULL}
  \item{unit}{Unit to be written into the default title. DEFAULT: NA}
  \item{\dots}{further arguments passed to \code{\link{hist}}}
}
\details{Uses \code{\link{split}} to categorize into groups.}
\value{NULL, used for plotting}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, Jan 2015}
\seealso{\code{\link{hist}}, \code{\link{tapply}} }
\examples{
groupHist(chickwts, weight, "feed", col=2)
groupHist(chickwts, "weight", "feed", col=2, unit="grams at age 6 weeks")
groupHist(chickwts, weight, feed, col=2, breaks=20, main="Hi there")
groupHist(iris, Petal.Width, Species)
}
\keyword{dplot}
\keyword{hplot}
\keyword{distribution}
