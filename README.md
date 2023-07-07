========================
Getting and Cleaning Data 
Week 4 Course Project
Name: Pamela Navarro-Gonzales
=====================
In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.
The source data set that this project was based on was obtained from the Human Activity Recognition Using Smartphones Data Set, which describes how the data was initially collected as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Training and test data were first merged together to create one data set, then the measurements on the mean and standard deviation were extracted for each measurement (79 variables extracted from the original 561), and then the measurements were averaged for each subject and activity, resulting in the final data set.


=====================

This repository contains the following files:
- README (this file): Provides an overview of the data set and how it was created
- R script (run_analysis.R): the R script that was used to create the data set
- Codebook (CodeBook.md): Describes the contents of the data set (data, variables and transformations used to generate the data)
- Tidy Data set (tidy_data.txt): Final dataset (output) 
====================

run_analysis.R contains all the code to perform the analysis described in this 5 steps:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Output file: "tidy_data.txt"

Note:
This script requires the dplyr package (version 4.1.3 was used).
R script using R version 4.1.2 