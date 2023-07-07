#Getting and cleaning data 
# Course Project
#Name: Pamela Navarro



library(dplyr)

####### I. Downloading Zip file #########

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(zipFile)
}

######## II. Read Data   ##########
train_sub <- read.table(file.path(dataPath, "train", "subject_train.txt"))
train_values <- read.table(file.path(dataPath, "train", "X_train.txt"))
train_activity <- read.table(file.path(dataPath, "train", "y_train.txt"))

test_sub <- read.table(file.path(dataPath, "test", "subject_test.txt"))
test_values <- read.table(file.path(dataPath, "test", "X_test.txt"))
test_activity <- read.table(file.path(dataPath, "test", "y_test.txt"))


activities <- read.table(file.path(dataPath, "activity_labels.txt")) # Read activity labels
colnames(activities) <- c("activityId", "activityLabel")


####### III. Create a tidy data set #######

### Step 1. Merge the training and the test sets to create one data set.

merged_data <- rbind(
  cbind(train_sub, train_values, train_activity),
  cbind(test_sub, test_values, test_activity)
)


#Assign column names
colnames(merged_data) <- c("subject", features[, 2], "activity")


### Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 


# Determine columns of data set that need to be kept
variables <- grepl("subject|activity|mean|std", colnames(merged_data))

# Extract data of these columns only
merged_data <- merged_data[, variables]


### Step 3. Uses descriptive activity names to name the activities in the data set
merged_data$activity <- factor(merged_data$activity, 
                                 levels = activities[, 1], labels = activities[, 2])


### Step 4: Appropriately labels the data set with descriptive variable names.

# Get column names and remove certain characters 
HA_cols <- colnames(merged_data)
HA_cols <- gsub("[\\(\\)-]", "", HA_cols)

## Modify column names 
HA_cols <- gsub("^f", "Frequency", HA_cols)
HA_cols <- gsub("^t", "Time", HA_cols)
HA_cols <- gsub("Acc", "Accelerometer", HA_cols)
HA_cols <- gsub("Gyro", "Gyroscope", HA_cols)
HA_cols <- gsub("Mag", "Magnitude", HA_cols)
HA_cols <- gsub("BodyBody", "Body", HA_cols)
HA_cols <- gsub("tBody", "TimeBody", HA_cols)
HA_cols <- gsub("angle", "Angle", HA_cols)
HA_cols<-gsub("gravity", "Gravity", HA_cols)
HA_cols <-gsub("-mean()", "Mean", HA_cols, ignore.case = TRUE)
HA_cols <-gsub("-std()", "STD", HA_cols, ignore.case = TRUE)
HA_cols <-gsub("-freq()", "Frequency", HA_cols, ignore.case = TRUE)

# Use modified column names  
colnames(merged_data) <- HA_cols

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data <- merged_data %>% 
  group_by(subject, activity) %>%
  summarise_each(list(mean = mean))

#Output file 
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)

