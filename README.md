getdata_course_project
======================

Course project for "Getting and Cleaning Data" Coursera course.

This repository contains an R script called run_analysis.R to create a tidy data set. It requires the following dataset to be downloaded and unzipped in the working directory:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

run_analysis.R does the following. 

1.  Creates a merged dataset of the training and the test sets.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Creates a tidy data set with the average of each variable for each activity and each subject.

The tidy data set is written to a text file "samsung_data_means.txt" in the working directory.
