# Set working directory
setwd("~/GetCleanData/Course Project/UCI HAR Dataset")

# Load necessary libraries
library(utils)
library(reshape2)

# Step 1- read in data and create data frames
activity_labels<-read.table("activity_labels.txt",
                            col.names = c("ActivityID", "Activity"))
features<-read.table("features.txt")

## create training data frame and add labels 
xtrain<-read.table("train/X_train.txt")
colnames(xtrain)<-features[,2]

ytrain<-read.table("train/Y_train.txt")
colnames(ytrain)[1]<-"ActivityID"

subjecttrain<-read.table("train/subject_train.txt")
colnames(subjecttrain)[1]<-"SubjectID"

activity<-factor(ytrain$ActivityID,levels=activity_labels$ActivityID,labels=activity_labels$Activity)
dataframe.train<-cbind(subjecttrain,activity,xtrain)

## create test data frame and add labels 
xtest<-read.table("test/X_test.txt")
colnames(xtest)<-features[,2]

ytest<-read.table("test/Y_test.txt")
colnames(ytest)[1]<-"ActivityID"

subjecttest<-read.table("test/subject_test.txt")
colnames(subjecttest)[1]<-"SubjectID"

activity<-factor(ytest$ActivityID,levels=activity_labels$ActivityID,labels=activity_labels$Activity)
dataframe.test<-cbind(subjecttest,activity,xtest)  

# Step 2 - merge training and test dataset
Mdata<-rbind(dataframe.train,dataframe.test)

# Step 3 - create a tidy dataset 
## calculate the average of each variable for each activity and each subject
msFilter<-c(".*mean\\(\\)", ".*std\\(\\)")
msIndex <-grep(paste(msFilter, collapse="|"), features$V2, value=FALSE)
msData<-Mdata[,c(1,2,2+msIndex)]
dataMelt<-melt(msData, id = c(1,2))
tidyData<-dcast(dataMelt, SubjectID+activity~variable,mean)

# Step 4 - save tidy data to directory
write.table(tidyData, file="TidyData.txt")
