
## Download Data Files from URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data1.zip")

### Read in Test Data
D1Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
head(D1Ytest)
D1Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
head(D1Xtest)
D1Subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
head(D1Subtest)

### Read in Training Data
D1Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
head(D1Ytrain)
D1Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
head(D1Xtrain)
D1Subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
head(D1Subtrain)

## Open Library 
library(reshape2)
## Set Working Directory
setwd("../")

## Get Activity Labels
activity_labels <- read.table("./Project/Data/UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))
## Get Variable Names
features <- read.table("./Project/Data/UCI HAR Dataset/features.txt")
column_names <-  features[,2]
column_names

## Read the data and label the variables
traindata <- read.table("./Project/Data/UCI HAR Dataset/train/X_train.txt")
testdata <- read.table("./Project/Data/UCI HAR Dataset/test/X_test.txt")
colnames(traindata) <- column_names
colnames(testdata) <- column_names
## Read the ids and label the the variables
trainsub_id <- read.table("./Project/Data/UCI HAR Dataset/train/subject_train.txt")
testsub_id <- read.table("./Project/Data/UCI HAR Dataset/test/subject_test.txt")
colnames(trainsub_id) <- "subject_id"
colnames(testsub_id) <- "subject_id"
## Read the activity ids and label the variables
trainact_id <- read.table("./Project/Data/UCI HAR Dataset/train/y_train.txt")
testact_id <- read.table("./Project/Data/UCI HAR Dataset/test/y_test.txt")
colnames(trainact_id) <- "activity_id"
colnames(testact_id) <- "activity_id"

## 1.)Merges the training and the test sets to create one data set
traindata2 <- cbind(traindata, trainsub_id , trainact_id)
testdata2 <- cbind(testdata, testsub_id , testact_id)

merged_data <- rbind(traindata2,testdata2)

## 2.)Extracts only the measurements on the mean and standard deviation for each measurement
mean_x <- grep("mean",names(merged_data),ignore.case=TRUE)
mean_names <- names(merged_data)[mean_x]
std_x <- grep("std",names(merged_data),ignore.case=TRUE)
std_names <- names(merged_data)[std_x]
sumstatsdata <-merged_data[,c("subject_id","activity_id",mean_names,std_names)]

## 3.)Uses descriptive activity names to name the activities in the data set
act_names <- merge(activity_labels,sumstatsdata,by.x="activity_id",by.y="activity_id",all=TRUE)
melt_sumstatsdata <- melt(act_names,id=c("activity_id","activity_name","subject_id"))

## 5.)Tidy data set with the average of each variable for each activity and each subject
mean_sumstatsdata <- dcast(melt_sumstatsdata,activity_id + activity_name + subject_id ~ variable,mean)

write.table(mean_sumstatsdata,"./Project/tidy_data.txt", row.name=FALSE )




