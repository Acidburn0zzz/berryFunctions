# Plot density of normal distribution based on just mean and sd
# Berry Boessenkool, July 23, 2014
normPlot <- function(
  mean=0, # average value as in \code{\link{dnorm}}
  sd=1, # standard deviation
  width=3, # distance (in sd) from plot ends to mean
  lines=TRUE, # Should vertical lines be plotted at mean +- n*sd?
  quant=TRUE, # should quantile regions be drawn with \code{fill} colors?
  fill=addAlpha("blue",c(2:6,7:2)/10), # color(s) passed to \code{\link{polygon}}
  cumulative=TRUE, # should cumulative density distribution be added?
  las=1, # arguments passed to \code{\link{plot}}
  main=paste("Normal density with\nmean =", signif(mean,2), "and sd =", signif(sd,2)), # main as in \code{\link{plot}}.
  ylim=lim0(dnorm(mean,mean,sd)), # limit for the y axis
  ylab="", # labels for the axes
  xlab="",
  type="n", # arguments passed to \code{\link{lines}}, type="l" for added line
  lty=1,
  col=par("fg"),
  mar=c(2,3,3,3), # margins
  keeppar=FALSE, # should margin parameters be kept instead of being restored to previous value?
  ... # further arguments passed to \code{\link{plot}} like lwd, xaxs, cex.axis, etc.
  )
{
op <- par(mar=mar)
# set up plot
xp <- c(mean-width*sd, mean+width*sd)
plot(xp, 0:1, ylim=ylim, las=las, type="n", ylab=ylab, xlab=xlab, main=main, ...)
# vertical lines at   mean +- n*sd
if(lines) abline(v=mean+floor(-width:width)*sd, col=8)
# recalculate coordinates with extrema, so that polygon goes to zero
x <- seq(par("usr")[1], par("usr")[2], length=400)
x <- c(mean-20*sd, x, mean+20*sd)
y <- dnorm(x, mean, sd)
# and plot that
if(!quant)
{
#fill <- fill[ceiling(length(fill)/2)] # get the middle color value
if(length(fill)>1) fill <- fill[4]
polygon(c(x,x[1]), c(0,y[-1],0), col=fill, border=NA)
}
else
{
qvals <- seq(0.05,0.95,by=0.1) # quantile borders
fill <- rep(fill, length=11) # fill recycling
xvals <- c(par("usr")[1], qnorm(qvals, mean, sd),par("usr")[2])
for(i in 2:length(xvals))
  {
  xv <- seq(xvals[i-1], xvals[i], length=30)
  yv <- dnorm(xv, mean, sd)
  polygon(c(xv,tail(xv,1),xv[1]), c(yv,0,0), col=fill[i-1], border=NA)
  }
yvals <- seq(ylim[2]/3, ylim[2]/20, len=5)
text(xvals[7:11], yvals, c(10,30,50,70,90), adj=c(1,-0.1))
segments(x0=xvals[6:2],x1=xvals[7:11],y0=yvals)
}
# PDF (probability density function) line:
lines(x, y, type=type, col=col, lty=lty)
# CDF (cumulated density function) line:
if(cumulative)
  {
  lines(x, pnorm(x, mean, sd)*par("usr")[4], type="l", col=2)
  axis(4, at=0:4/4*par("usr")[4], labels=0:4/4, col.axis=2, las=1, col=2)
  }
box()
if(!keeppar) par(op)
}
