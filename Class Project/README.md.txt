This file contains the R program

run_analysis.R

The program takes a series of data sets saved in the data folder "./temp" in the current working directory. 

The data consists of measurements taken from wearable computing devices that were fitted to 30 volunteers engaged in 6 different physical activities.  The data sets were downloaded from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Of the 28 original text files, only the following are used in the run_analysis.R program:

./temp/UCI HAR Dataset/activity_labels.txt  - defines the 6 different activities                    
./temp/UCI HAR Dataset/features.txt  - identifies the different measurements obtained from the devices
./temp/UCI HAR Dataset/test/subject_test.txt - gives the volunteer number for each test                    
./temp/UCI HAR Dataset/test/X_test.txt  - gives the measurement value for each test                    
./temp/UCI HAR Dataset/test/y_test.txt 	- provides the number of the activity performed
./temp/UCI HAR Dataset/train/subject_train.txt - gives the volunteer number for each training                    
./temp/UCI HAR Dataset/train/X_train.txt - gives the measurement value for each training                   
./temp/UCI HAR Dataset/train/y_train.txt - provides the number of the activity performed

The test and training data are combined into a single dataset.  The mean and standard deviation values for each measurement type are extracted for each test. A tidy data set is created which takes the average value of each measurement type for each volunteer and activity.  The output is saved to the file:

tidy_data_set.txt