
# Download and unzip the dataset
#Dataset should be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Dataset will be downloaded in the current working directory.

data_file <- "dataset.zip"

if (!file.exists(data_file)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, data_file, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(data_file) 
}

# Read test data from X_test and y_test files
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
#Read train data from X_train and y_train files
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
#Read feature data file
  data_feature <- read.table("UCI HAR Dataset/features.txt")
  
# Read activity labels
  activity_data <- read.table("UCI HAR Dataset/activity_labels.txt")
  
# Assign column names to test data. Use data from feature.txt
  colnames(x_test) <- data_feature[,2]
  colnames(y_test) <- "activity_id"
  colnames(subject_test) <- "subject_id"
  
# Assign column names to train data. Use data from feature.txt
  colnames(x_train) <- data_feature[,2]
  colnames(y_train) <- "activity_id"
  colnames(subject_train) <- "subject_id"
  
## Assign column names to activity data.
  colnames(activity_data) <- c("activity_id","activity_description")
  
 
#Add y_test and subject data to x_data to create data_test.
  data_test <- cbind(y_test,subject_test,x_test)

 #Add y_train and subject data to x_train to create data_train.
  data_train <- cbind(y_train,subject_train,x_train)
  
## 1. Merge the training and the test sets to create one data set.
  data_final <- rbind(data_test,data_train)
  
##2. Extract only the measurements on the mean and standard deviation for each measurement.
   required_data_columns <- grep(".*mean.*|.*std.*", data_feature[,2])
   required_data_columns <- data_feature[required_data_columns,2]
   
   final_data_columns <-c("activity_id","subject_id",as.character(required_data_columns))
   
   data_final <- subset(data_final,select=final_data_columns)
   
##3. Use descriptive activity names to name the activities in the data set
   data_final$activity_id <- factor(data_final$activity_id , levels = activity_data[,1], labels = activity_data[,2])
   

##4. Appropriately labels the data set with descriptive variable names.     
     
   names(data_final)<-gsub("^t", "time", names(data_final))
   names(data_final)<-gsub("^f", "frequency", names(data_final))
   names(data_final)<-gsub("BodyBody", "body", names(data_final))
   names(data_final) = gsub('-mean', 'mean', names(data_final))
   names(data_final) = gsub('-std', 'std', names(data_final))
   names(data_final) <- gsub('[-()]', '', names(data_final))
   names(data_final) <- gsub('activity_id', 'activity', names(data_final))
   names(data_final) <- gsub('subject_id', 'subject', names(data_final))
# change all column names to lowercase
   names(data_final) <- tolower(names(data_final))
   
##5.From the data set in step 4, creates a second, 
##  independent tidy data set with the average of each variable for each activity and each subject.
   tidy_data <- ddply(data_final, .(activity, subject), function(x) colMeans(data_final[, 3:81]))
   
   write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
   
   