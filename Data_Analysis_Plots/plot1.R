##  In this program, data from the UC Irvine Machine Learning
##  Repository on individual household electric consumption is
##  loaded into R.  A histogram of the global active power for
##  2/1/2007 - 2/2/2007 is created and saved as a png file.
##
library(lubridate)

## Extract the data from the downloaded zip file

datafiles <- "exdata-data-household_power_consumption.zip"
unzip(datafiles)
filename <- "household_power_consumption.txt"

## load the dataset into R considering the data from dates: 
##  2007-02-01 to 2007-02-02. 

cnam <- read.table(filename,header=T,nrows=1,sep=";")
data <- read.table(filename,skip=66637,nrows=2880,sep=";")
names(data) <- gsub("_","",tolower(names(cnam)))

## Format the dates and time series.
data$date   <- as.Date(data$date,"%d/%m/%Y")
data$time   <- as.character(data$time)
data$datetime   <- strptime(paste(data$date,data$time),"%Y-%m-%d %H:%M:%S")

## Create a histogram of global active power consumption in kilowatts for both days.

with(data, 
     hist(globalactivepower, 
          col="red",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png")
dev.off()

## Save household electric consumption dataset to a new dataset that can be
## accessed by the three R programs that follow.
newdat <- data

## End plot1.R
