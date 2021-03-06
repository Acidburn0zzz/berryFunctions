berryFunctions
==============

My misc functions package. Notable: colPoints, horizHist, logAxis, pointZoom, smallPlot, lsc.

Code to install from CRAN:
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/berryFunctions)](http://cran.r-project.org/package=berryFunctions) [![downloads](http://cranlogs.r-pkg.org/badges/berryFunctions)](http://www.r-pkg.org/services)

```R
install.packages("berryFunctions")
library(berryFunctions)
?berryFunctions # run the examples to get an idea of what's possible.
```

Code to install the most recent development version from github:

```R
if(!require(devtools)) install.packages("devtools")
devtools::install_github("brry/berryFunctions")
library(berryFunctions)
?berryFunctions
```

If direct installation from CRAN doesn't work, your R version might be too old. In that case, an update is really recommendable: [r-project.org](http://www.r-project.org/). If you can't update R, try installing from source (github) via devtools as mentioned above. If that's not possible either, here's a manual workaround:
click on **Download ZIP** (to the right, [link](https://github.com/brry/berryFunctions/archive/master.zip)), unzip the file to some place, then
```R
setwd("that/path")
dd <- dir("berryFunctions-master/R", full=T)
dummy <- sapply(dd, source)
```
This creates all R functions as objects in your globalenv workspace (and overwrites existing objects of the same name!).
