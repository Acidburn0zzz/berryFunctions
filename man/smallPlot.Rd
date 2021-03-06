\name{smallPlot}
\alias{smallPlot}
\title{inset small plot within figure}
\description{inset plot with margins, background and border}
\usage{smallPlot(expr, x=c(5,70), y=c(50,100), x1,y1,x2,y2, mar=c(12, 14, 3, 3),
mgp=c(1.8, 0.8, 0), bg=par("bg"), border=par("fg"), las=1, resetfocus=TRUE, ...)}
\arguments{
  \item{expr}{expression creating a plot. Can be code within {braces}.}
  \item{x, y}{Position of small plot, relative to current figure region (0:100). max and min from vector arre taken. DEFAULT: 5-70, 50-100}
  \item{x1,y1,x2,y2}{Positions of topleft and bottomright corner. Replaced with x,y, kept here for backcompatibility.}
  \item{mar}{Margin vector in relative units (0:100), thus behaves differently than \code{\link{par}(mar)}. DEFAULT: c(12, 14, 3, 3)}
  \item{mgp}{MarGinPlacement: distance of xlab/ylab, numbers and line from plot margin, as in \code{\link{par}}, but with different default. DEFAULT: c(1.8, 0.8, 0)}
  \item{bg}{Background. DEFAULT: par("bg")}
  \item{border}{Border around inset plot. DEFAULT: par("fg")}
  \item{las}{LabelAxisStyle. DEFAULT: 1}
  \item{resetfocus}{reset focus to original plot? Specifies where further low level plot commands are directed to. DEFAULT: TRUE}
  \item{\dots}{further arguments passed to \code{\link{par}. new=F} removes old plot. May mess things up - please tell me for which arguments!}
}
\value{parameters of small plot, invisible.}
\section{Warning}{setting mai etc does not work!}
\author{Berry Boessenkool, \email{berry-b@gmx.de}, 2014}
\seealso{\code{\link{colPointsHist}} for an example of usage, \code{\link[TeachingDemos]{subplot}} and \code{\link[ade4]{add.scatter}} for alternative solutions to this problem that do not set margins.}
\examples{
# Basic usage:
plot(1:10)
smallPlot(plot(5:1) )
smallPlot(plot(5:1), x=c(30,80), y=30:60, bg="yellow", yaxt="n")
# if R warns "figure margins too large", try dragging the plot viewer bigger

# select focus for further add-on's:
points(3, 2, pch="+", cex=2)
smallPlot( plot(5:1), bg="blue", resetfocus=FALSE )
points(3, 2, pch="+", cex=2)

# More par settings:
smallPlot( plot(50:1), bg=6, mai=c(0.2, 0.3, 0.1, 0.1))
# If you find any more that screw things up, please let me know!
smallPlot( plot(5:1), bg=8, ann=FALSE)
smallPlot(plot(10:50)) # with default bg ("transparent"), old plot is kept
smallPlot(plot(10:50))

# complex graphics in code chunks:
plot(1:10)
smallPlot( {plot(5:1, ylab="Blubber"); lines(c(2,4,3));
            legend("topright", "BerryRocks!", lwd=3)    }, bg="white" )

# in par multiple figure, things now work as well if resetfocus=TRUE:
op <- par("plt")
par(mfrow=c(2,3))
for(i in 1:2) plot(cumsum(rnorm(50)))
smallPlot( plot(50:1), bg=6)
plot(3:9) # opens new window
smallPlot( plot(50:1), bg=6, resetfocus=FALSE)
points(3, 2, pch="+", cex=2)
plot(3:9) # plot in next window, but it is still small
par(plt=op)
plot(3:9)  # margins, las and mgp are still changed

}
\keyword{hplot}
