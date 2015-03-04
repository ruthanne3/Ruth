##  In this program, data from the UC Irvine Machine Learning
##  Repository on individual household electric consumption is
##  loaded into R.  A time series plot of the energy sub metering 
##  for 2/1/2007 - 2/2/2007 is created and saved as a png file.
##
##  Note:  The plot1.R program must be executed first in order to generate
##  the formatted dataset.

## load the generated dataset from 'plot1.R' into R
data <- newdat

## Create a line plot of energy sub metering during the 2 day time interval
png(file = "plot3.png")

with(data, {
     plot(datetime,submetering1, 
          type="l",
          xlab="",
          ylab="Energy sub metering")
     points(datetime,submetering2, 
          type="l",col="red")
     points(datetime,submetering3, 
          type="l",col="blue")
     })

legend("topright", 
       lty = 1,
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

## End plot3.R
