# This describes the details of the data and the logic for course project for "Getting and Cleaning Data"

# Original Data
# All the original data came from the data collected from the accelerometers from the Samsung Galaxy S smartphone.
# As per the original information provided with the data:
# The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
# These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a 
# median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
# signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth 
# filter with a corner frequency of 0.3 Hz
# Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
# Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
# Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
# (Note the 'f' to indicate frequency domain signals). 

# These signals were used to estimate variables of the feature vector for each pattern:  
# '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


# Modification Of Data
# All the data from test and train were merged into a single data file.
# From the original data, once all the data were mer)columns having the word "mean" or "std()" were subset along with the subject and activity column.
# The numeric activity indicators were replaced by the descriptive activity information as provided in activity_labels.txt
# The column names were changed to be compliant with the principles of 'tidy' data.
# The cleaning operations performed on column names were
# 	i.   Convert all names to lower case
#	ii.  Remove all "-" from the names
#   iii. Remove all "()" from names
# The list below details the original column names and the modified column names


#	Orig Col Names				Modified Column Names
#	tBodyAcc-mean()-X			tbodyaccmeanx
#	tBodyAcc-mean()-Y			tbodyaccmeany
#	tBodyAcc-mean()-Z			tbodyaccmeanz
#	tBodyAcc-std()-X			tbodyaccstdx
#	tBodyAcc-std()-Y			tbodyaccstdy
#	tBodyAcc-std()-Z			tbodyaccstdz
#	tGravityAcc-mean()-X		tgravityaccmeanx
#	tGravityAcc-mean()-Y		tgravityaccmeany
#	tGravityAcc-mean()-Z		tgravityaccmeanz
#	tGravityAcc-std()-X			tgravityaccstdx
#	tGravityAcc-std()-Y			tgravityaccstdy
#	tGravityAcc-std()-Z			tgravityaccstdz
#	tBodyAccJerk-mean()-X		tbodyaccjerkmeanx
#	tBodyAccJerk-mean()-Y		tbodyaccjerkmeany
#	tBodyAccJerk-mean()-Z		tbodyaccjerkmeanz
#	tBodyAccJerk-std()-X		tbodyaccjerkstdx
#	tBodyAccJerk-std()-Y		tbodyaccjerkstdy
#	tBodyAccJerk-std()-Z		tbodyaccjerkstdz
#	tBodyGyro-mean()-X			tbodygyromeanx
#	tBodyGyro-mean()-Y			tbodygyromeany
#	tBodyGyro-mean()-Z			tbodygyromeanz
#	tBodyGyro-std()-X			tbodygyrostdx
#	tBodyGyro-std()-Y			tbodygyrostdy
#	tBodyGyro-std()-Z			tbodygyrostdz
#	tBodyGyroJerk-mean()-X		tbodygyrojerkmeanx
#	tBodyGyroJerk-mean()-Y		tbodygyrojerkmeany
#	tBodyGyroJerk-mean()-Z		tbodygyrojerkmeanz
#	tBodyGyroJerk-std()-X		tbodygyrojerkstdx
#	tBodyGyroJerk-std()-Y		tbodygyrojerkstdy
#	tBodyGyroJerk-std()-Z		tbodygyrojerkstdz
#	tBodyAccMag-mean()			tbodyaccmagmean
#	tBodyAccMag-std()			tbodyaccmagstd
#	tGravityAccMag-mean()		tgravityaccmagmean
#	tGravityAccMag-std()		tgravityaccmagstd
#	tBodyAccJerkMag-mean()		tbodyaccjerkmagmean
#	tBodyAccJerkMag-std()		tbodyaccjerkmagstd
#	tBodyGyroMag-mean()			tbodygyromagmean
#	tBodyGyroMag-std()			tbodygyromagstd
#	tBodyGyroJerkMag-mean()		tbodygyrojerkmagmean
#	tBodyGyroJerkMag-std()		tbodygyrojerkmagstd
#	fBodyAcc-mean()-X			fbodyaccmeanx
#	fBodyAcc-mean()-Y			fbodyaccmeany
#	fBodyAcc-mean()-Z			fbodyaccmeanz
#	fBodyAcc-std()-X			fbodyaccstdx
#	fBodyAcc-std()-Y			fbodyaccstdy
#	fBodyAcc-std()-Z			fbodyaccstdz
#	fBodyAcc-meanFreq()-X		fbodyaccmeanfreqx
#	fBodyAcc-meanFreq()-Y		fbodyaccmeanfreqy
#	fBodyAcc-meanFreq()-Z		fbodyaccmeanfreqz
#	fBodyAccJerk-mean()-X		fbodyaccjerkmeanx
#	fBodyAccJerk-mean()-Y		fbodyaccjerkmeany
#	fBodyAccJerk-mean()-Z		fbodyaccjerkmeanz
#	fBodyAccJerk-std()-X		fbodyaccjerkstdx
#	fBodyAccJerk-std()-Y		fbodyaccjerkstdy
#	fBodyAccJerk-std()-Z		fbodyaccjerkstdz
#	fBodyAccJerk-meanFreq()-X	fbodyaccjerkmeanfreqx
#	fBodyAccJerk-meanFreq()-Y	fbodyaccjerkmeanfreqy
#	fBodyAccJerk-meanFreq()-Z	fbodyaccjerkmeanfreqz
#	fBodyGyro-mean()-X			fbodygyromeanx
#	fBodyGyro-mean()-Y			fbodygyromeany
#	fBodyGyro-mean()-Z			fbodygyromeanz
#	fBodyGyro-std()-X			fbodygyrostdx
#	fBodyGyro-std()-Y			fbodygyrostdy
#	fBodyGyro-std()-Z			fbodygyrostdz
#	fBodyGyro-meanFreq()-X		fbodygyromeanfreqx
#	fBodyGyro-meanFreq()-Y		fbodygyromeanfreqy
#	fBodyGyro-meanFreq()-Z		fbodygyromeanfreqz
#	fBodyAccMag-mean()			fbodyaccmagmean
#	fBodyAccMag-std()			fbodyaccmagstd
#	fBodyAccMag-meanFreq()		fbodyaccmagmeanfreq
#	fBodyBodyAccJerkMag-mean()	fbodybodyaccjerkmagmean
#	fBodyBodyAccJerkMag-std()	fbodybodyaccjerkmagstd
#	fBodyBodyAccJerkMag-meanFreq()		fbodybodyaccjerkmagmeanfreq
#	fBodyBodyGyroMag-mean()		fbodybodygyromagmean
#	fBodyBodyGyroMag-std()		fbodybodygyromagstd
#	fBodyBodyGyroMag-meanFreq()	fbodybodygyromagmeanfreq
#	fBodyBodyGyroJerkMag-mean()	fbodybodygyrojerkmagmean
#	fBodyBodyGyroJerkMag-std()	fbodybodygyrojerkmagstd
#	fBodyBodyGyroJerkMag-meanFreq()		fbodybodygyrojerkmagmeanfreq


# High Level Code logic for run_analysis.R
# 1. Get the column names from features.txt
# 2. Merge the data for test from 3 files (subject_test.txt, X_test.tst, y_test.txt)
# 3. Merge the data for train from 3 files (subject_train.tst, X_test.tst, y_test.txt)
# 4. Merge the consolidated test and train data from the above steps
# 5. Add the column names
# 6. Subset the data based on columns having the word "mean" or "std()" in their names and the subject and activity column
# 7. Clean up the column names as mentioned above
# 8. Convert the numeric activity indicators to descriptive ones
# 9. Summarize the data by finding the mean for each column by subject and activity.


