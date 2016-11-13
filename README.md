# Getting-Cleaning-Data

This repo contains a course 3 project for Getting and Cleaning data.

# run_analysis.R conains the script which creates a tidy data set.
  Dataset should be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" <br />
  Dataset will be downloaded in the current working directory.<br />
  Read test data from X_test and y_test files.<br />
  Read train data from X_train and y_train files.<br />
  Read feature data file from features.txt file.<br />
  Read activity labels from activity_labels.txt file.<br />
  Assign column names to test data using features from feature.txt file.<br />
  Assign column names to training data using features from feature.txt file.<br />
  Assign column names to activity data.<br />
  Merge y_test and subject data to x_data to create data_test.<br />
  Merge y_train and subject data to x_train to create data_train.<br />
  Merge the training and the test sets to create one data set.<br />
  Extract only the measurements on the mean and standard deviation for each measurement.<br />
  Use descriptive activity names to name the activities in the data set.<br />
  Appropriately labels the data set with descriptive variable names.<br />
  creates a new, independent tidy data set with the average of each variable for each activity and each subject.<br />
  
# code_book.md
  This codebook contains all descriptive variables presnt in the tida data set, tidi_data.txt file.
  
# tidy_data.txt
  This file contains the new tidy data set obtained by execution of the script from run_analysis.R
