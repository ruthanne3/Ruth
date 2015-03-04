##  In this program, data from the UC Irvine Machine Learning
##  Repository on individual household electric consumption is
##  loaded into R.  A time series plot of the global active power for
##  2/1/2007 - 2/2/2007 is created and saved as a png file.
##
##  Note:  The plot1.R program must be executed first in order to generate
##  the formatted dataset.

## load the generated dataset from 'plot1.R' into R
data <- newdat

## Create a line plot of global active power during the 2 day time interval

with(data, 
     plot(datetime,globalactivepower, 
          type="l",
          xlab="",
          ylab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png")
dev.off()

## End plot2.R
