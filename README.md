Getting and Cleaning Data - Course Project
==========================================

This was built for the course project of the “Getting and Cleaning Data” course at Coursera.
--------------------------------------------------------------------------------------------

Goal: Create a tidy data data set with the help of R to analyze results captured in the “Human Activity Recognition Using Smartphones” dataset
----------------------------------------------------------------------------------------------------------------------------------------------

Requirments for submission
--------------------------

You should create one R script called run\_analysis.R that does the
following.  
1.Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for
each measurement.  
3. Uses descriptive activity names to name the activities in the data
set. 4. Appropriately labels the data set with descriptive variable
names.  
5. From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each
subject.

Url =
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

------------------------------------------------------------------------

*Before you start install follwing packages*  
library(reshape2) library(dplyr)

------------------------------------------------------------------------

Steps:  
1) Make sure to verify the fileurl location the zip file
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>.  
2) The script will download this file and unzip it. Once you unzip
verify the folder contents on “UCI HAR Dataset”.  
3) The scipt will use read.table function load train, test and subject
data.  
4) Once loaded all three dataset will be merged.  
5) Mean and STD will extracted.  
6) Set appropriate column name and update the labels.  
7) Finally create a tidydata.txt file using write.file.

------------------------------------------------------------------------

Contents
--------

R File = run\_analysis.R  
Outpile File = Tidydata.txt  
Codebook.md - Column name definations on tidydata.txt
