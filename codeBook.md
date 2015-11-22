---
title: "Codebook"
author: "Joanne Schell"
date: "21 Nov 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
Read Samsung movement study data and outupt a tidy data set describing mean and standard deviation data from the study.

##Study design and data processing
The study utilized Samsung smartphones to gather telemtry data on the movement of 30 test subjects conducting six different activities.  The resulting data was broken into a training and test data set.  

###Collection of the raw data
Samsung phone accelerometers and gyros recorded specific data about position in time and how that position changed over time.

##Creating the tidy datafile
To create the tidy datafile, I combined the training and test data, applied applicable column names, harvested columns needed for our data (means and standard deviations), applied subject information to the data, applied text activity labels to the data, and summarized the data based on subject and activity, gathering the means of all data for each subject-activity combination.

###Guide to create the tidy data file
1.  Download the data .zip and unzip to your working directory.
2.  Import both training and test data sets for measurements, activiry labels, features (column definitions), and subjects.
3.  Assign column names to the measurement data, based on features data. 
4.  Select columns related to means and standard deviations; save to a new data frame for organizational purposes.
5.  Assign labels to activity numbers.  Add that data to the measurement data frame.
6.  Add subject information to measurement data frame.
7.  Create data field containing both subject and activity.  Group on that field and create summary of data with means for each group.  Save to a new data frame.
8.  Output the summary data.

###Cleaning of the data
The readme.md file in this repository contains more specific data on steps taken to clean the data.  It's perhaps not the most elegant solution, but it works.

##Description of the variables in the tidy_data.txt file
tidy_data.txt contains 180 rows and 87 columns.  Each row represents an observation; one row represents the subject and activity under which the observation was taken, and the other 86 columns represent the averages of means or standard deviation measurements taken from the original data set.  I am providing no summary of the data here because it is so large as to be unreadable.

From the data's README.txt file, a brief description of the data averaged follows:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Note: I do not provide units for the variables below, because the original data did not include units, and I would not want to make assumptions about their measurement methods.

###subject.activity
Character string naming the subject number (1-30) and the activity they performed when the data was collected.  Values for activity are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###t.Body.Acc.mean.X , t.Body.Acc.mean.Y, t.Body.Acc.mean.Z
These Numeric variables represent the mean of time domain body acceleration in the X, Y, and Z axes.

###t.Body.Acc.std.X, t.Body.Acc.std.Y, t.Body.Acc.std.Z
These Numeric variables represent the standard deviation of time domain body acceleration in the X, Y, and Z axes.

###t.gravity.Acc.mean.X, t.gravity.Acc.mean.Y, t.gravity.Acc.mean.Z
These Numeric variables represent the mean of time domain gravity-induced acceleration in the X, Y, and Z axes.

###t.gravity.Acc.std.X, t.gravity.Acc.std.Y, t.gravity.Acc.std.Z 
These Numeric variables represent the standard deviation of time domain body acceleration in the X, Y, and Z axes.

###t.Body.Acc.Jerk.mean.X, t.Body.Acc.Jerk.mean.Y, t.Body.Acc.Jerk.mean.Z 
These Numeric variables represent the mean of time domain body acceleration in the X, Y, and Z axes.

###t.Body.Acc.Jerk.std.X, t.Body.Acc.Jerk.std.Y, t.Body.Acc.Jerk.std.Z 
These Numeric variables represent the standard deviation of time domain body acceleration in the X, Y, and Z axes.

###t.Body.Gyro.mean.X, t.Body.Gyro.mean.Y, t.Body.Gyro.mean.Z
These Numeric variables represent the mean of time domain gyroscopic measurement in the X, Y, and Z axes.

###t.Body.Gyro.std.X, t.Body.Gyro.std.Y, t.Body.Gyro.std.Z
These Numeric variables represent the standard deviation of time domain gyroscopic measurement in the X, Y, and Z axes.

###t.Body.Gyro.Jerk.mean.X, t.Body.Gyro.Jerk.mean.Y, t.Body.Gyro.Jerk.mean.Z
These Numeric variables represent the mean of time domain gyroscopic jerk measurement in the X, Y, and Z axes.

###t.Body.Gyro.Jerk.std.X, t.Body.Gyro.Jerk.std.Y, t.Body.Gyro.Jerk.std.Z 
These Numeric variables represent the standard deviation of time domain gyroscopic jerk measurement in the X, Y, and Z axes.

###t.Body.Acc.Mag.mean
This numeric variable represents the mean of the body's acceleration with respect to the magnetic field of the earth over time.

###t.Body.Acc.Mag.std
This numeric variable represents the standard deviation of the body's acceleration with respect to the magnetic field of the earth over time.

###t.gravity.Acc.Mag.mean
This numeric variable represents the mean of gravity-induced acceleration over time.

###t.gravity.Acc.Mag.std
This numeric variable represents the standard deviation of gravity-induced acceleration over time.

###t.Body.Acc.Jerk.Mag.mean
This numeric variable represents the mean of the body's acceleration jerk measurement with respect to the magnetic field of the earth over time.

###t.Body.Acc.Jerk.Mag.std
This numeric variable represents the standard deviation of the body's acceleration jerk measurement with respect to the magnetic field of the earth over time.

###t.Body.Gyro.Mag.mean
This numeric variable represents the mean of the body's gyroscopic measurements with respec to the magnetic field of the earth over time.

###t.Body.Gyro.Mag.std
This numeric variable represents the standard deviation of the body's gyroscopic measurements with respect to the magnetic field of the earth over time.

###t.Body.Gyro.Jerk.Mag.mean 
This numeric variable represents the mean of the body's gyroscopic jerk measurement with respect to the magnetic field of the earth over time.

###t.Body.Gyro.Jerk.Mag.std 
This numeric variable represents the standard deviation of the body's gyroscopic jerk measurement with respect to the magnetic field of the earth over time.

###f.Body.Acc.mean.X, f.Body.Acc.mean.Y, f.Body.Acc.mean.Z
These Numeric variables represent the mean of frequency domain body acceleration in the X, Y, and Z axes.

###f.Body.Acc.std.X, f.Body.Acc.std.Y, f.Body.Acc.std.Z
These Numeric variables represent the standard deviation of frequency domain body acceleration in the X, Y, and Z axes.

###f.Body.Acc.mean.Freq.X, f.Body.Acc.mean.Freq.Y, f.Body.Acc.mean.Freq.Z
These Numeric variables represent the mean of frequency domain body acceleration in the X, Y, and Z axes considering frequency.

###f.Body.Acc.Jerk.mean.X, f.Body.Acc.Jerk.mean.Y, f.Body.Acc.Jerk.mean.Z
These Numeric variables represent the mean of frequency domain body acceleration in the X, Y, and Z axes.

###f.Body.Acc.Jerk.std.X, f.Body.Acc.Jerk.std.Y, f.Body.Acc.Jerk.std.Z
These Numeric variables represent the standard deviation of frequency domain body acceleration in the X, Y, and Z axes.

###f.Body.Acc.Jerk.mean.Freq.X, f.Body.Acc.Jerk.mean.Freq.Y, f.Body.Acc.Jerk.mean.Freq.Z
These Numeric variables represent the mean of frequency domain body acceleration jerk in the X, Y, and Z axes considering frequency.

###f.Body.Gyro.mean.X, f.Body.Gyro.mean.Y, f.Body.Gyro.mean.Z
These Numeric variables represent the mean of frequency domain gyroscopic measurement in the X, Y, and Z axes.

###f.Body.Gyro.std.X, f.Body.Gyro.std.Y, f.Body.Gyro.std.Z
These Numeric variables represent the standard deviation of frequency domain gyroscopic measurement in the X, Y, and Z axes.

###f.Body.Gyro.mean.Freq.X, f.Body.Gyro.mean.Freq.Y, f.Body.Gyro.mean.Freq.Z
These Numeric variables represent the mean of frequency domain gyroscopic measurement in the X, Y, and Z axes considering frequency.

###f.Body.Acc.Mag.mean
This numeric variable represents the frequency domain mean of gravity-induced acceleration over time.

###f.Body.Acc.Mag.std 
This numeric variable represents the frequency domain standard deviation of gravity-induced acceleration over time.

###f.Body.Acc.Mag.mean.Freq
This numeric variable represents the frequency domain mean of gravity-induced acceleration over time considering frequency.
 
###f.Body.Body.Acc.Jerk.Mag.mean, f.Body.Body.Acc.Jerk.Mag.std, f.Body.Body.Acc.Jerk.Mag.mean.Freq
These numeric variables represent the mean, standard deviation and mean in the frequency domain considering frequency of the body's acceleration jerk measurement with respect to the magnetic field of the earth over time.

###f.Body.Body.Gyro.Mag.mean, f.Body.Body.Gyro.Mag.std, f.Body.Body.Gyro.Mag.mean.Freq
These numeric variables represent the mean, standard deviation and mean in the frequency domain considering frequency of the body's gyroscopic measurement with respect to the magnetic field of the earth over time.
 
###f.Body.Body.Gyro.Jerk.Mag.mean, f.Body.Body.Gyro.Jerk.Mag.std, f.Body.Body.Gyro.Jerk.Mag.mean.Freq
These numeric variables represent the mean, standard deviation and mean in the frequency domain considering frequency of the body's gyroscopic jerk measurement with respect to the magnetic field of the earth over time.

###angle.t.Body.Acc.Mean.gravity.Mean
This numeric variable represents the mean of the body's gravity-induced angular acceleration over time.

###angle.t.Body.Acc.Jerk.Mean.gravity.Mean
This numeric variable represents the mean of the body's gravity-induced angular jerk acceleration over time.

###angle.t.Body.Gyro.Mean.gravity.Mean: 
This numeric variable represents the mean of the body's gravity-induced angular gyroscopic measurement over time.

###angle.t.Body.Gyro.Jerk.Mean.gravity.Mean: 
This numeric variable represents the mean of the body's gravity-induced angular gyroscopic measurement over time.

###angle.X.gravity.Mean, angle.Y.gravity.Mean, angle.Z.gravity.Mean
These numeric variables represent the mean of time domain gravity-induced change in angular measurement in the X, Y, and Z axes.

##Sources
Data came from the study described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The actual data is available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

