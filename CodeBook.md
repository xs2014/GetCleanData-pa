# CodeBook.md

---

This Markdown file provides descriptions of the datasets from the course project, the steps required to obtain the tidy dataset, as well as the tidy dataset in a text file.

---

## Introduction

This course project uses the data collected from the accelerometers on a Samsung Galaxy S smartphone.  The various accelerometer readings were gathered from 30 volunteers (subjects) while they were performing different activities.  When a subject took an action at a specific time, 561 features were used to describe that action.

The datasets can be obtained via the link below: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

#### The dataset includes the following files:

* `features_info.txt` Shows information about the variables used on the feature vector.

* `features.txt` List of all features.

* `activity_labels.txt` Links the class labels with their activity name.

* `train/X_train.txt` Training set.

* `train/y_train.txt` Training labels.

* `test/X_test.txt` Test set.

* `test/y_test.txt` Test labels.

#### The following files are available for the train and test data:

* `train/subject_train.txt` Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* `train/Inertial Signals/total_acc_x_train.txt` The acceleration signal from the smartphone accelerometer X axis in standard gravity units `g`. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 

* `train/Inertial Signals/body_acc_x_train.txt` The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* `train/Inertial Signals/body_gyro_x_train.txt` The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The purpose of this project is to demonstrate one’s ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.


## Data text files used

The following text files from the dataset were used for creating the final tidied dataset:

* `subject_train.txt` and `subject_test.txt
* `y_train.txt` and `y_test.txt`
* `X_train.txt` and `X_test.txt`
* `features.txt`
* `activity_labels.txt`

## Variables included with tidied dataset

In the tidied dataset, there are 21 variables used for describing what is being obtained at a particular time.  These are:

1. `Subject.Number`: Subject ID 
2. `Activity.ID`: Activity ID between 1 to 6
3. `Activity`: The activity labels
4. `tBodyAccMag-mean()`: The average body acceleration magnitude
5. `tGravityAccMag-mean()`: The average gravity acceleration magnitude
6. `tBodyAccJerkMag-mean()`: The average body jerk signal
7. `tBodyGyroMag-mean()`: The average body acceleration magnitude
8. `tBodyGyroJerkMag-mean()`: The average jerk signal
9. `fBodyAccMag-mean()`: Signal 4 after the FFT was applied
10. `fBodyBodyAccJerkMag-mean()`: Signal 6 after the FFT was applied
11. `fBodyBodyGyroMag-mean()`: Signal 7 after the FFT was applied
12. `fBodyBodyGyroJerkMag-mean()`: Signal 8 after the FFT was applied
13. `tBodyAccMag-std()`: The standard deviation of the acceleration magnitude 
14. `tGravityAccMag-std()`: The standard deviation gravity acceleration magnitude
15. `tBodyAccJerkMag-std()`: The standard devition of the body jerk signal 
16. `tBodyGyroMag-std()`: The standard deviation body acceleration magnitude 
17. `tBodyGyroJerkMag-std()`: The standard deviation jerk signal
18. `fBodyAccMag-std()`: Signal 13 after the FFT was applied
19. `fBodyBodyAccJerkMag-std()`: Signal 15 after the FFT was applied
20. `fBodyBodyGyroMag-std()`: Signal 16 after the FFT was applied
21. `fBodyBodyGyroJerkMag-std()`: Signal 17 after the FFT was applied

## Steps of tidying data

1. Read all the files in your directory into `R` as tables and create traning and test data frames.
2. Merge training and test dataset.
3. Create a tidy dataset with the average of each variable for each activity and each subject.
4. Save the tidied data into directory.

## The final data frame

The data was exported as a text file.  There are a total of 180 rows and 68 columns in the file. The `R` code for creating this dataset is included in this repo: `run_analysis.R`.
