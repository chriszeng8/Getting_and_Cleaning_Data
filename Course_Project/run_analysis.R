## Getting and Cleaning Data, Coursera Course Project
## Chris.Z.Zeng
## Jan 25 2015

rm(list=ls()) #clear all irrelevant variables

library(data.table)
library(dplyr)

## NOTE: Please set the working directory:
## ====================================================================================
#>setwd("The_Parent_Folder_of_the_UCI_HAR_Dataset_Directory")
## ====================================================================================

## ===================== 0. read in all key datasets. =================================
## Activity_labels and feature names
Activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)[,2]
Features_names<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)[,2]

## Training dataset (70% data)
Train_X<-read.table("./UCI HAR Dataset/train/X_train.txt")         # training data
Train_subj<-read.table("./UCI HAR Dataset/train/subject_train.txt")[,1]    # subjects for training data
Train_Y<-read.table("./UCI HAR Dataset/train/y_train.txt")[,1]         # y labels for training data (in integer)

## Testing dataset (30% data)
Test_X<-read.table("./UCI HAR Dataset/test/X_test.txt")            # test data
Test_subj<-read.table("./UCI HAR Dataset/test/subject_test.txt")[,1]       # subjects for test data
Test_Y<-read.table("./UCI HAR Dataset/test/y_test.txt")[,1]            # y labels for test data (in integer)

## ==== 1. Merges the training and the test sets to create one data set. ==============================
Merged_X_Data<-rbind(Train_X,Test_X) # Clipping traing X data and traing Y data together

## ==== 2. Extracts only the measurements on the mean and standard deviation for each measurement.=====
mean_std_col_num<-grep("mean|std|Labelled|Subject", Features_names)
Extract_measures<-Merged_X_Data[,mean_std_col_num] #Subsetting the columns based on the intger column index vector.

## ==== 3. Uses descriptive activity names to name the activities in the data set. ====================
Y_Activity_label_number<-c(Train_Y,Test_Y)
Y_Activity_label<-Activity_labels[Y_Activity_label_number]
Subjects<-c(Train_subj,Test_subj)

## ==== 4. Appropriately labels the data set with descriptive variable names. =========================
## 4a. Remove all illegal symbols from the variables name.
Features_names<-gsub("\\(\\)","", Features_names)  #remove () first
Features_names<-gsub("\\(","_", Features_names)    #replace ( with _ underscore
Features_names<-gsub("\\)","", Features_names)     #remove )
Features_names<-gsub("-", "_", Features_names)     #remove hypen -
Features_names<-gsub("\\,", "_", Features_names)   #replace , with underscore

## 4b. Keeping all var names unique by appending index to the replicated varibale names
Features_names<-make.names(Features_names,unique=TRUE)

## 4c. Assignment the variables names as column names back of the data fram
# Find the variable name corresponding to the extracted columns (i.e., col corresponding to mean and std)
Extracted_var_name<-Features_names[mean_std_col_num] 
names(Extract_measures)<-Extracted_var_name #Extract_merge is the filtered merged table.

## ==== 5. From the data set in step 4, creates a second, independent tidy data set with the average ==
## ==== of each variable for each activity and each subject.===========================================
Extract_measures2<-cbind(Subjects,Y_Activity_label_number,Y_Activity_label,Extract_measures)
melt_extract_measure<-melt(Extract_measures2, id = c("Subjects","Y_Activity_label_number","Y_Activity_label"), measure.vars = Extracted_var_name)
tidy_extract_data<-dcast(melt_extract_measure, Subjects + Y_Activity_label ~ variable, mean)

## FINALLY, write the final tidy data into a text file.
write.table(tidy_extract_data, file = "./tidy_data.txt",row.name=F)
print ("complete")