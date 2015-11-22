run_analysis <- function() {
  
   #install.packages("dplyr")
   library(dplyr)
  
#using data from here: 
#  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
#  Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
#  Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
#  Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  
  
  
#  1.Merges the training and the test sets to create one data set.
#  2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3.Uses descriptive activity names to name the activities in the data set
#  4.Appropriately labels the data set with descriptive variable names. 
#  5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  
    #check for data in correct location.
    setwd("H:/BigStegShare/COURSERA/DataScience/")
    if (!file.exists("./UCI HAR Dataset")) {
        error("No data available.")
    }
  
    #read in data.
    featureBase <- read.table("./UCI HAR Dataset/features.txt")
    activity_labels <- read.table("./UCI HAR DataSet/activity_labels.txt")
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
    body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")    
    body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
    body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
    body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
    body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
    total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
    total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")    
    total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
    
    X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

    #merge training and test data sets per requirement 1.
    X <- rbind(X_train, X_test)
    Y <- rbind(Y_train, Y_test)
    subject <- rbind(subject_train, subject_test)
    
    #Remove parens and commas from the feature list column V2- get rid of V1 all together- don't need it(?)
    featureBase2 <- gsub("\\(|\\)","",featureBase$V2)
    features <- gsub(",","-",featureBase2)
    
    #apply featureslist to column names of X
    colnames(X) <- features
    
    #select columns with only mean or std deviation per requirement 2
    newcols <- features[grep("std|mean",features, ignore.case=TRUE)]
    newX <- X[,newcols]
    
    #convert activity numbers in Y to the words for readability.
    # first set column names so join will work!
    colnames(Y) <- c("activity")
    colnames(activity_labels) <- c("activity","activity.type")
    YLabeled <- join(Y,activity_labels)
    
    #set activity label column names and bind it to our data.frame per requirement 3
    colnames(Y) <- c("Activity")
    #X2 <- cbind(newX,YLabeled$activity,YLabeled$activity.type)
    X2 <- cbind(newX,YLabeled$activity.type)
     
    #set subject column name and bind it to our data.frame
    colnames(subject) <- c("Subject")
    X2 <- cbind(X2,subject$Subject)

    #create data.frame with subject and activity merged for grouping
    X3 <- mutate(X2, fullName = paste(c("Subject"),subject$Subject,Y2$activity.type))
    
    #Remove columns that aren't tidy
    X3$`subject$Subject` <- NULL
    X3$`YLabeled$activity.type` <- NULL
 
    #create data.frame grouped by the subject ID and activity per requirement 5
    X4 <- X3 %>% group_by(fullName) %>% summarize_each(funs(mean))
    
    #label data appropriately with descriptive feature names per requirement 4
    colnames(X4) <- c("subject.activity", "t.Body.Acc.mean.X", "t.Body.Acc.mean.Y", "t.Body.Acc.mean.Z", "t.Body.Acc.std.X", "t.Body.Acc.std.Y",  
                      "t.Body.Acc.std.Z","t.gravity.Acc.mean.X", "t.gravity.Acc.mean.Y", "t.gravity.Acc.mean.Z", "t.gravity.Acc.std.X", "t.gravity.Acc.std.Y", 
                      "t.gravity.Acc.std.Z", "t.Body.Acc.Jerk.mean.X", "t.Body.Acc.Jerk.mean.Y", "t.Body.Acc.Jerk.mean.Z", "t.Body.Acc.Jerk.std.X", 
                      "t.Body.Acc.Jerk.std.Y", "t.Body.Acc.Jerk.std.Z", "t.Body.Gyro.mean.X", "t.Body.Gyro.mean.Y", "t.Body.Gyro.mean.Z", 
                      "t.Body.Gyro.std.X", "t.Body.Gyro.std.Y", "t.Body.Gyro.std.Z", "t.Body.Gyro.Jerk.mean.X", "t.Body.Gyro.Jerk.mean.Y", 
                      "t.Body.Gyro.Jerk.mean.Z", "t.Body.Gyro.Jerk.std.X", "t.Body.Gyro.Jerk.std.Y", "t.Body.Gyro.Jerk.std.Z", "t.Body.Acc.Mag.mean", 
                      "t.Body.Acc.Mag.std", "t.gravity.Acc.Mag.mean", "t.gravity.Acc.Mag.std", "t.Body.Acc.Jerk.Mag.mean", "t.Body.Acc.Jerk.Mag.std", 
                      "t.Body.Gyro.Mag.mean", "t.Body.Gyro.Mag.std", "t.Body.Gyro.Jerk.Mag.mean", "t.Body.Gyro.Jerk.Mag.std", "f.Body.Acc.mean.X", 
                      "f.Body.Acc.mean.Y", "f.Body.Acc.mean.Z", "f.Body.Acc.std.X", "f.Body.Acc.std.Y", "f.Body.Acc.std.Z", "f.Body.Acc.mean.Freq.X", 
                      "f.Body.Acc.mean.Freq.Y", "f.Body.Acc.mean.Freq.Z", "f.Body.Acc.Jerk.mean.X", "f.Body.Acc.Jerk.mean.Y", "f.Body.Acc.Jerk.mean.Z", 
                      "f.Body.Acc.Jerk.std.X", "f.Body.Acc.Jerk.std.Y", "f.Body.Acc.Jerk.std.Z", "f.Body.Acc.Jerk.mean.Freq.X", 
                      "f.Body.Acc.Jerk.mean.Freq.Y", "f.Body.Acc.Jerk.mean.Freq.Z", "f.Body.Gyro.mean.X", "f.Body.Gyro.mean.Y", 
                      "f.Body.Gyro.mean.Z", "f.Body.Gyro.std.X", "f.Body.Gyro.std.Y", "f.Body.Gyro.std.Z", "f.Body.Gyro.mean.Freq.X", 
                      "f.Body.Gyro.mean.Freq.Y", "f.Body.Gyro.mean.Freq.Z", "f.Body.Acc.Mag.mean", "f.Body.Acc.Mag.std", "f.Body.Acc.Mag.mean.Freq", 
                      "f.Body.Body.Acc.Jerk.Mag.mean", "f.Body.Body.Acc.Jerk.Mag.std", "f.Body.Body.Acc.Jerk.Mag.mean.Freq", "f.Body.Body.Gyro.Mag.mean", 
                      "f.Body.Body.Gyro.Mag.std", "f.Body.Body.Gyro.Mag.mean.Freq", "f.Body.Body.Gyro.Jerk.Mag.mean", "f.Body.Body.Gyro.Jerk.Mag.std", 
                      "f.Body.Body.Gyro.Jerk.Mag.mean.Freq", "angle.t.Body.Acc.Mean.gravity.", "angle.t.Body.Acc.Jerk.Mean.gravity.Mean", 
                      "angle.t.Body.Gyro.Mean.gravity.Mean", "angle.t.Body.Gyro.Jerk.Mean.gravity.Mean", "angle.X.gravity.Mean", "angle.Y.gravity.Mean", 
                      "angle.Z.gravity.Mean")
    

  
    #output tidy data per instructions
    write.table(X4,"./tidy_data1.txt",row.name=FALSE)
  
  
  
  
}