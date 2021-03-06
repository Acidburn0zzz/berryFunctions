\name{ciBand}
\alias{ciBand}
\title{polygon confidence bands}
\description{\code{\link{polygon}} for confidence interval bands, can handle NA's well}
\usage{ciBand(yu, yl, ym=NULL, x=1:length(yu), 
na="interpolate", nastars=TRUE, singlepoints=TRUE, args=NULL, 
add=FALSE, colm="green3", colb=addAlpha(colm), border=NA, las=1,
ylim=range(yu,yl, finite=TRUE), ... )}
\arguments{
  \item{yu}{y values of upper confidence region boundary}
  \item{yl}{y values of lower confidence region boundary}
  \item{ym}{y values of median/mean line. Only added if this argument is given. DEFAULT: NULL}
  \item{x}{x values (one ascending vector). DEFAULT: 1:length(yu)}
  \item{na}{Method used at NA points. One of "interpolate" or "remove". DEFAULT: "interpolate"}
  \item{nastars}{If na="interpolate", should stars be drawn at places that used to be NA? DEFAULT: TRUE}
  \item{singlepoints}{If na="remove", add points for places surrounded by NAs? can be a boolean (T/F) vector of length three for upper, lower, median. Code to identify isolated points is taken from wq::plotTs. DEFAULT: TRUE}
  \item{args}{List of arguments passed to \code{\link{points}} for the previous two arguments. DEFAULT: NULL}
  \item{add}{Add to existing plot? If FALSE, plot is called before adding confidence interval. DEFAULT: FALSE}
  \item{colm}{Color for median/mean line. DEFAULT: "green3"}
  \item{colb}{Color of the confidence region band. DEFAULT: addAlpha(colm)}
  \item{border}{\code{\link{polygon}} border. DEFAULT: NA}
  \item{las}{LabelAxisStyle (axis labels turned upright, see \code{\link{par}}). DEFAULT: 1}
  \item{ylim}{limits of plot. DEFAULT: range(yu,yl, finite=TRUE)}
  \item{\dots}{Further arguments passed to \code{\link{plot}}  - or maybe better polygon??}
}
\value{None, currently. Used for drawing.}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, July 2015}
\seealso{\code{\link{polygon}}, \code{\link{approx2}} }
\examples{
y1 <- c(1,3,4,2,1,4,6,8,7)
y2 <- c(5,6,5,6,9,8,8,9,10)
y3 <- c(4,4,5,4,4,6,7,8,9)
ciBand(yl=y1, yu=y2, ym=y3)

y1[6:7] <- NA
ciBand(yl=y1, yu=y2, ym=y3) # interpolation marked with stars if nastars=TRUE
ciBand(yl=y1, yu=y2, ym=y3, na="remove")
lines(y1, col=3, type="o")
lines(y2, col=3, type="o")

y2[1] <- NA
ciBand(yl=y1, yu=y2, ym=y3) # next observation carried backwards (NAs at begin)
# LOCF (last observation carried forwards if NAs at end)
# See ?approx2 for median/mean imputation in these cases
ciBand(yl=y1, yu=y2, ym=y3, na="remove")
y2[9] <- NA
ciBand(yl=y1, yu=y2, ym=y3)
ciBand(yl=y1, yu=y2, ym=y3, na="remove")  # NAs at both ends
y2[1] <- 5
ciBand(yl=y1, yu=y2, ym=y3)
ciBand(yl=y1, yu=y2, ym=y3, na="remove")  # NA only at end

# Actual usefull stuff:  sample size dependency of max and mean
ssdep_max <- function(n) quantile(  replicate(n=200, expr=max(rnorm(n)) )  )
ssdep_mean<- function(n) quantile(  replicate(n=200,expr=mean(rnorm(n)) )  )
x <- 1:100
res_max <- sapply(x, ssdep_max)
res_mean <- sapply(x, ssdep_mean)
ciBand(yl=res_max[2,], yu=res_max[4,], ym=res_max[3,], x=x, ylim=c(-0.5, 3))
ciBand(res_mean[2,], res_mean[4,], res_mean[3,], x=x, add=TRUE, colm="purple")
}
\keyword{aplot}
\keyword{hplot}
