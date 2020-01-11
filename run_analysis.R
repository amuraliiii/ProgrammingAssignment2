# Getting and Cleaning Data Assignment 1/10/2020
# Requirmment 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load Packages and download and unzip data
library(reshape2)
library(dplyr)

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourcefile <- "getdata_dataset.zip'"
download.file(fileurl,sourcefile)
unzip(sourcefile)

filepath <- "UCI HAR Dataset"    
#Verify the following files are available in the filepath above before running
filefeature <- paste(filepath, "/features.txt", sep="")
fileactivities  <- paste(filepath, "/activity_labels.txt", sep="")
filesubject_test  <-   paste(filepath, "/test/subject_test.txt" , sep="")
filex_test <- paste(filepath, "/test/X_test.txt" , sep="")
filey_test <- paste(filepath, "/test/y_test.txt" , sep="")
filesubject_train <- paste(filepath, "/train/subject_train.txt" , sep="")
filex_train <- paste(filepath, "/train/X_train.txt" , sep="")
filey_train <- paste(filepath, "/train/y_train.txt", sep="")

#read data and move to tables
tablefeaturesnames <- read.table(filefeature)
tableactivitynames <- read.table(fileactivities, header = FALSE)

tablex_test <- read.table(filex_test, header = FALSE ) #Features test
tabley_test <- read.table(filey_test, header = FALSE) #activity test
tablesubjects_test <- read.table(filesubject_test, header = FALSE) #subject test

tablex_train <- read.table(filex_train, header = FALSE) #Features train
tabley_train <- read.table(filey_train, header = FALSE) #activity train
tablesubjects_train <- read.table(filesubject_train, header = FALSE) #subject train

# Combine data using rbind
tablex_train_test <- rbind(tablex_train, tablex_test) #features combined
tabley_train_test <- rbind(tabley_train, tabley_test) #activity combined
tablesubjects_train_test <- rbind(tablesubjects_train,tablesubjects_test) #subject combined




# update column names
colnames(tablex_train_test) <- t(tablefeaturesnames[2])
colnames(tabley_train_test) <- "Activity"
colnames(tablesubjects_train_test) <- "Subject"

# combine all 3 into a single table
tableAll <- cbind(tablex_train_test,tabley_train_test, tablesubjects_train_test)

# Filter for mean and std
tableMeasures <- grep(".*Mean.*|.*Std.*", names(tableAll), ignore.case=TRUE)
rColumns <- c(tableMeasures, 562, 563)
dim(tableAll)

#extract data
Data <- tableAll[,rColumns]
dim(Data)

#Naming
Data$Activity <- as.character(Data$Activity)
for (i in 1:6){
  Data$Activity[Data$Activity == i] <- as.character(tableactivitynames[i,2])
}
Data$Activity <- as.factor(Data$Activity)

#List of names
names(Data)

#Replace short names will full name
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))

#Create tidy dataset with avg foreach variable
Data$Subject <- as.factor(Data$Subject)
Data <- data.table(Data)

tData <- aggregate(. ~Subject + Activity, Data, mean)
tData <- tData[order(tData$Subject,tData$Activity),]
#Save Data
write.table(tData, file = "Tidydata.txt", row.names = FALSE)






  
              
