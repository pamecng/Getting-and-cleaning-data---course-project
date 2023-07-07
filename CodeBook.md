This is the code book for the project

Name: Pamela Navarro 

A. source data

The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data set Information: 
1. Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
2. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
3. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
4. The following files are available for the train and test data. Their descriptions are equivalent. 
   - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
   - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128   element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
   - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
   - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


B. R Script: "run_analysis.R"

I. Download data sets and unzip files 

II. Read files

train_sub <- "subject_train.txt""  #Contains train data of 21/30 volunteer subjects being observed
train_values <- "X_train.txt" #Contains recorded features train data
train_activity <- "y_train.txt" #Contains train data of activities’code labels
test_sub <- "subject_test.txt" #Contains test data of 9/30 volunteer test subjects being observed
test_values <- "X_test.txt" #Contains recorded features test data
test_activity <- "y_test.txt" #Contains test data of activities’code labels 
activities <- activity labels


III. Create a tidy dataset: Data cleaning performed in 5 steps:

Step 1: Merges the training and the test sets to create one data set.
The training and test datasets were merged to create one preliminary data set. 
Use rbind() and cbind function to generate "merged_data"

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement (i.e. signals containing the strings mean and std)
      

Step 3. Uses descriptive activity names to name the activities in the data set
The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names
      

Step 4.Appropriately labels the data set with descriptive variable names:
* code column in merged_data renamed into activities
* All Acc in column’s name replaced by Accelerometer
* All Gyro in column’s name replaced by Gyroscope
*  All BodyBody in column’s name replaced by Body
*  All Mag in column’s name replaced by Magnitude
* All start with character f in column’s name replaced by Frequency
* All start with character t in column’s name replaced by Time

Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData is created by sumarizing merged_data taking the means of each variable for each activity and each subject, after grouped by subject and activity.

Output file: "tidy_data.txt"
      