run_analysis<-function() {
 
  ## The objective of this function is to take the original data from the data
  ## collected from the accelerometers from the Samsung Galaxy S smartphone and transform it
  ## to a tidy data set as per the requirements specified in the course project guidelines
  
  
  ##********** 
  ## Get the names of the variables pertaining to the original data    
  ## These variable names will serve as the column heading for the merged dataset
  ## Approach:
  ##  1. Read the variables names from the features.txt file
  ##  2. subset just the second column so you can eleminate the sequence # column from features.txt
  ##  3. Transpose the resultant dataset so that you have single row of entries.
  ##*************
  
  features_org<-read.table("features.txt")
  features_org_nms<-features_org[,2]
  features_org_nmas_transp<-t(features_org_nms)
    
  
  ##****
  ## Read Original Data
  ## Original data has been split into 2 groups "test" and "train"
  ## Each group has 3 sets of files.
  ## Approach
  ## Read the files and merge the data within each group using cbind
  ## Merge the data between 2 groups using rbind
  ## Resultant data frame will be of dimensions 10299 rows and 563 columns
  ##********
  
  ##*** Merge data for test group ***
  
  testx<-read.table("subject_test.txt")
  testxtest<-read.table("x_test.txt")
  testytest<-read.table("y_test.txt")
  
  testx12<-cbind(testx,testxtest)
  testx123<-cbind(testx12, testytest)
  
  ##*** Merge data for train group **
  
  trainx<-read.table("subject_train.txt")
  trainxtrain<-read.table("x_train.txt")
  trainytrain<-read.table("y_train.txt")
  
  train12<-cbind(trainx, trainxtrain)
  train123<-cbind(train12,trainytrain)
  cp1data<-rbind(testx123,train123)
  
  ## merged data does not have column names. We will use the original variable names
  ## retrieved above as the column names for the data
  ## converting column names to characters from factors
  
  orgnmes<-as.character(features_org_nmas_transp)
  
  orgcolnmes<-c("subject",orgnmes,"activity")
  colnames(cp1data)<-orgcolnmes
  
  ## As per the course project requirements we need to consider only columns which are data related to mean or stdev
  ## so from the measured data we will extract only columns having mean  or std() in their names
  ## resultant data set will have dimensions of 10299 rows and 81 columns
  ## This data will the base data set going forward
  
  ptrn="mean|std()"
  allcls<-grep(ptrn, names(cp1data))
  
  ## We will need the first and last column too as they relate to the subject and activity
  allrcols<-c(1,allcls,563)
  cp1datamsd<-cp1data[,allrcols]
  
  ## Tidy up the dataset by tidying the column names and replacing the numeric activity indicators to 
  ## actual descriptive ones
  ## Approach
  ## 1. Convert column names to lowercase
  ## 2. Remove "-" from the column names
  ## 3. Remove "()" from the column names
  
  cp1_org_colnames<-names(cp1datamsd)
  mod_col_names<-tolower(cp1_org_colnames)
  mod_col_names<-gsub("-","", mod_col_names)
  mod_col_names<-gsub("()","", mod_col_names)
  
  ## convert the numeric activity indicators to descriptive ones as specified in
  ## activity_lables. txt file
  ## Approach
  ## 1. Subset just the activity column
  ## 2. Replace the numeric values with descriptors
  ## 3. Merge the column to the base data set
  ## 4. Remove the original activity column that had numeric indicators
  
  activity_data<-cpidatamsd[ ,81]
  activity_data<-gsub(1,"WALKING", activity_data)
  
  ## after 1st substitution the remaining numeric values are coerced into character
  activity_data<-gsub("2","WALKING_UPSTAIRS", activity_data)
  activity_data<-gsub("3","WALKING_DOWNSTAIRS", activity_data)
  activity_data<-gsub("4","SITTING", activity_data)
  activity_data<-gsub("5","STANDING", activity_data)
  activity_data<-gsub("6","LAYING", activity_data)
  
  cp4data<-cbind(cp1datamsd,activity_data)
  cp4finaldata<-cp4data[,c(1:80,82)]
  
  colnames(cp4finaldata)[81]<-"activity"
  
  ## as per the course requirements summarize the data by finding the means of all columns by subject and by activity
  
  cp4tidydata<-ddply(cp4finaldata, .(subject,activity), numcolwise(mean))
}