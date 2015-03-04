##  In this program, data from the UC Irvine Machine Learning
##  Repository on individual household electric consumption is
##  loaded into R.  Four different diagrams are created in one plot 
##  using data from 2/1/2007 - 2/2/2007.  The results are saved as a png file.
##
##  Note:  The plot1.R program must be executed first in order to generate
##  the formatted dataset.

## load the generated dataset from 'plot1.R' into R
data <- newdat

## Create a four subplots using global active power,
## energy submetering and voltage.

png(file = "plot4.png")

## Create subplots
par(mfcol = c(2,2)) 

## a) subplot of line graph of global active power
with(data, 
     plot(datetime,globalactivepower, 
          type="l",
          xlab="",
          ylab="Global Active Power"))

## b) subplot of line graph of energy sub metering
with(data, { 
     plot(datetime,submetering1, 
          type="l",
          xlab="",
          ylab="Energy sub metering")
     points(datetime,submetering2, 
          type="l",col="red")
     points(datetime,submetering3, 
          type="l",col="blue")
     legend("topright", 
          bty = "n",
          lty = 1,
          col = c("black","red","blue"), 
          legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    })   

## c) subplot of voltage 

with(data, 
     plot(datetime,voltage, 
          type="l",
          ylab="Voltage"))

## d) subplot of global reactive power
with(data, 
     plot(datetime,globalreactivepower, 
          type="l",
          ylab="Global_reactive_power"))   

dev.off()

## End plot4.R
