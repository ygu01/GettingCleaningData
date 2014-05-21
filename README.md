

###########
run_analysis.R is the script used in the data cleaning process.

###########
The script is written in R

In order to run the script, Package "car" needs to be downloaded and installed.


###########

Original dataset is downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###########
Download the original data to your working directory in r
run the script
The clean data will be generated and saved automatically to your working directory with the file name "cleandata.csv".


###########
cleandata.csv is the new dataset cleaned from the original dataset.
The cleaning steps are as following:
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement. 
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive activity names. 
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


