# DataScienceCleaningData

# The objective of this project is to subset some data from the data collected from the accelerometers
# from the Samsung Galaxy S smartphone and summarize it by subject and activity type.

# The following are the initial steps to be performed
# 1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 2. Unzip the data and ensure that you copy the following files into your R-Working directory
#     a) activity_labels.txt
#     b) features.txt
#     c) subject_test.txt
#     d) X_test.txt
#     e) y_test.txt
#     f) subject_train.txt
#     g) X_train.txt
#     h) y_train.txt

#  Run the script run_analysis.R to subset and summarize the data for columns whose names contain either the word 'mean' 
#  or the word 'std()'.
#  The summary will be the mean value of the subsetted columns by subject and activity.
#  The name of the tidy data frame that will be created is cp4tidydata.

#  Note : for the script to run ensure that you install and load the dplyr package before executing the script.
#  Refer to the code.md file and the comments in the run_analysis.R script for additional details.

