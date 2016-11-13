# Getting-Cleaning-Data
This repo contains a course project for Getting and Cleaning data.

# run_analysis.R conains the script which creates a tidy data set.
  Dataset should be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  Dataset will be downloaded in the current working directory.
  Read test data from X_test and y_test files.
  Read train data from X_train and y_train files.
  Read feature data file from features.txt file.
  Read activity labels from activity_labels.txt file.
  Assign column names to test data using features from feature.txt file.
  Assign column names to training data using features from feature.txt file.
  Assign column names to activity data.
  Merge y_test and subject data to x_data to create data_test.
  Merge y_train and subject data to x_train to create data_train.
  Merge the training and the test sets to create one data set.
  Extract only the measurements on the mean and standard deviation for each measurement.
  Use descriptive activity names to name the activities in the data set.
  Appropriately labels the data set with descriptive variable names.
  creates a new, independent tidy data set with the average of each variable for each activity and each subject.
  
# code_book.md
  This codebook contains all descriptive variables presnt in the tida data set, tidi_data.txt file.
  
# tidy_data.txt
  This file contains the new tidy data set obtained by execution of the script from run_analysis.R
