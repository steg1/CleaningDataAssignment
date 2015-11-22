# CleaningDataAssignment
Repository for Coursera Getting and Cleaning Data class programming assignment
Included in this repository is an R script designed to import a set of data, process it, and output certain summarized data to a text file.  Specifics follow:

1. I imported data from UCI.EDU taken from a study of human movement telemetry recorded via Samsung smartphones.  Specific details on the data are here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   The data itself are available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  I downloaded and unzipped the data file into my working directory prior to running the "run_analysys.R" script against it.  The data set has multiple files in assorted subfolders, including training and test data files.  I used read.table to import the relevant data.  Imported data frames:
    X_train - measurement data (training set).  Rows of numeric measurement data; 561 columns representing different measurements.
    X_test - measurement data (test set).  Rows of numeric measurement data; 561 columns representing different measurements.
    Y_train - activity data (training set).  A numeric value mapping to what activity was taking place when the data was collected.  Values were 1-6.
    Y_test - activity data (test set).  A numeric value mapping to what activity was taking place when the data was collected.  Values were 1-6.
    subject_train - subject number for each row of data (training).  Each row contains a numeric value for each participating subject, values 1-30.
    subject_test - subject number for each row of data (test).  Each row contains a numeric value for each participating subject, values 1-30.
    featureBase - data describing each type of measurement taken (used for column names).
    activity_labels - data describing the six activity levels and their indexes.
    I did not use any of the data in "inertial signals" subfolders because their data did not appear relevant to the exercise of using only mean and standard deviation data.

2. Next, I merged the training and test data sets. As noted above, the data resides in both training and test files with the same columns; this assignment required merging them into one data set.  I used rbind to "paste" the test data to the bottom of the training data, resulting in the following data frames:
    X - measurement data with dimensions 10299 x 561.
    Y - activity a numeric value mapping to what activity was taking place when the data was collected.  Values were 1-6.
    subject - numeric value IDing the subject for each row of data, values 1-30.

3. Next, I added featurelist data to the X data set.  First I cleaned the parentheses and dashes out of the data for ease of use; this is probably not strictly required.  This resulted in temporary data set "featureBase2" and the final features data frame "features".  I then set that data to the column names of the X data set using "colnames(X) <- features.  Next, I grepped out the columns needed for the assignment (columns containing mean and standard deviation data) and created data frame "newX" that had only the relevant columns in it.

4. I then converted the activity numbers into words based on the data in activity_labels.  I did this by naming the column of data in activity_labels and then joining the activities in Y to activity_labels, resulting in data frame "YLabeled".  Next, I used cbind to attach this data to data frame "newX", resulting in data frame "X2".  

5. Next, I created a mutation of X2 with a new variable "fullName" containing a concatenated subject-and-activity-label.  This mutation went into data frame X3.

6. I removed extraneous columns from merging the subject and activity from X3, now that that data was codified in "fullName".

7. Finally, I piped X3 into group_by(fullName) to group the data by the both subject and activity, and piped that into summarize_each(funs(mean)) to provide means for all data belonging to each subject by activity.  This I stored in data frame X4.

8. The final requirement was to make the column names more readable.  This was difficult to do, considering their technical nature, so I simply made their existing structure more readable by separating "words" by dots (e.g. "tBodyAccstdZ" became "t.Body.std.Z").  I put all the "new" column names in a large string and assigned that to X4 using colnames(X4).  The tidy dataset was now complete.

9.  Lastly, using write.table as directed in the assignment, I output the contents of X4 to file "tidy_data1.txt".
