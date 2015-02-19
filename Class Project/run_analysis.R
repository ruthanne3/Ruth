##  This program takes a series of data sets saved in text files and creates
##  a single tidy data set that summarizes the data for each measurement, activity,
##  and subject.
##
##  The data are measurements taken from 30 volunteers engaging in different activities
##  while wearing wearable computing devices.  The data set was obtained from the 
##  following url:
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##  The file was downloaded and unzipped into a folder called "temp" in the current 
##  working directory.
##----------------------------------------------------------------------------------
library(dplyr)
library(tidyr)

##  Identify the temporary directory (td) for this project
  
td <- "./temp"

##  Create a vector that contains the file paths for the 28 .txt files included in
##  the original "UCI HAR Datatset.zip" file.

all.names <- list.files(td,full.names=T,include.dirs=F,recursive=T)

##0) Data preparation: Open and create two training and test datasets for merging.
##   Filenames in all.names:  
##    [14] "./temp/UCI HAR Dataset/test/subject_test.txt"                       
##    [15] "./temp/UCI HAR Dataset/test/X_test.txt"                             
##    [16] "./temp/UCI HAR Dataset/test/y_test.txt"  

dat1 <- read.table(all.names[14],col.names="volunteer")
dat2 <- read.table(all.names[15])
dat3 <- read.table(all.names[16],col.names="activity")

data <- cbind(dat1,dat3,dat2)
data <- mutate(data,type="test")
test.data <- data

##  Filenames in all.names:
##    [26] "./temp/UCI HAR Dataset/train/subject_train.txt"                     
##    [27] "./temp/UCI HAR Dataset/train/X_train.txt"                           
##    [28] "./temp/UCI HAR Dataset/train/y_train.txt"

dat1 <- read.table(all.names[26],col.names="volunteer")
dat2 <- read.table(all.names[27])
dat3 <- read.table(all.names[28],col.names="activity")

data <- cbind(dat1,dat3,dat2)
data <- mutate(data,type="train")
train.data <- data

## 1) The training and test datasets are merged into one data set

data <- rbind(test.data,train.data)

## 2) Only the mean and standard deviation measurements for 
##    each measurement type are selected.

##    Measurement names are located in:  [2] "./temp/UCI HAR Dataset/features.txt"
mnames <- read.table(all.names[2])
keep <- grepl("-mean()",mnames$V2,fixed=T)|
        grepl("-std()", mnames$V2,fixed=T)
measurements <- mnames$V1[keep]+2 ## gives column numbers of data variables to keep
data <- select(data,volunteer,activity,measurements)

## 3) Descriptive activity names are used to name the activities in the data set

##    Activity names are located in: [1] "./temp/UCI HAR Dataset/activity_labels.txt" 
anames <- read.table(all.names[1])
data$activity <- factor(data$activity,labels=anames$V2)

## 4) the data set variables are labeled with descriptive names taken from the 
##    features text file that describes each measurement type. The dashes "-" and
##    "()" are removed from the labels and replaced with ".".

cnames <- as.character(mnames$V2[keep])
cnames<-gsub("()","",cnames,fixed=T)
cnames<-gsub("-",".",cnames,fixed=T)
names(data)[3:68]<-cnames

##    A tidy data set is then created for each measurement type and value by 
##    gathering the data columns (3:68) into two columns, measurement and value.
data <- gather(data,measurement,value,3:68)

## 5) Create an independent data set with the average of each measurement type for
##    each activity and volunteer.
data <- arrange(data,volunteer,activity,measurement)
data <- group_by(data,volunteer,activity,measurement)
avg.data<- summarise(data,average.value=mean(value))

## write the avg.data set to file "tidy_data_set.txt"
write.table(avg.data,"tidy_data_set.txt",row.name=F,col.names=T,append=F)

## clean the Global Environment
rm(dat1,dat2,dat3,test.data,train.data,mnames,measurements,keep,cnames,
   anames,all.names,td)

## End program




