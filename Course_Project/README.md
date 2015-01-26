# Getting and Cleaning Data

## Course Project
#### By Chris Z.Zeng Jan 25, 2015

## R script file

In this repository, you will find an R script called ```run_analysis.R``` that performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Setup
1. Download the [Samsung Galaxy S data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and store into a local folder. After unzipping the file, you should have a ```UCI HAR Dataset``` folder.
2. Down and put the ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set the parent folder as your working directory using ```setwd()``` command.
3. Run ```source("run_analysis.R")```which produces a output text file called ```tiny_data.txt``` in your working directory.

## Packages required

```run_analysis.R``` requires you to install ```reshape2``` package. To do so, type ```install.packages("reshape2")```.

