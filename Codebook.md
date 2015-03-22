# Codebook 

This document describes the variables contained in the resulting dataset obtained by processing the initial dataset stored in:

[Human Activity Recognition using SmartPhones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

## Initial Dataset

The initial dataset is a zip file containing the following relevant files:

#### Root directory:

* features_info.txt : Description of the 561 variables contained in the dataset
* features.txt      : Names of the variables (list of 561 names) Ex: tBodyAcc-XYZ-mean()-X
* activity_types.txt: Names of the activity types beeing tracked (list of 6 activities) Exs: WALKING, SITTING, etc.

#### Test Directory:

* X_test.txt        : Variable measurements for test dataset
* y_test.txt	  : Activity numbers for each of the rows in the test dataset
* subject_test.txt  : Subject ID for each of the rows in the test dataset


#### Train Directory:

* X_train.txt        : Variable measurements for train dataset
* y_train.txt        : Activity numbers for each of the rows in the train dataset
* subject_train.txt  : Subject ID for each of the rows in the train dataset


## Transformations performed by 'run_analysis.R' Script

The script performs the following transformations:

1. Merge test and train datasets in a single unified dataset containing all the original meassurements
2. Add the column names to the unified dataset by reading them from 'features.txt' file
3. Obtain a new dataset by filtering out all the columns not containing the words 'mean' or 'std' in their names
4. Add a new column to the unified dataset containing the activity_id for each of the rows. Information taken from 'y_test.txt' and 'y_train.txt' files
5. Add a new column to the unified dataset containing the text description of the activities by performing a join between the unified dataset and the information contained within the 'activity_types' file
6. Add a new column to the unified dataset containing the subject ids as per the information present in the 'subject_test.txt' and 'subject_train.txt' files.
7. Group unified dataset by subject and activity_description
8. Calcultate group average for all the variables within the unified dataset

The resulting dataset contains the average of all the variables taken from the original dataset (those having 'mean' or 'std' in their titles) accross the different groups of subjects and activity types.

The resulting dataset is stored in a text file called 'analysistidy.txt'
 
## Variable descriptions:

* subjects: IDs of the subject producing the measurements
* activity_Description: Text description of the activities type included in the meassurement

#### Remaining columns: 

Average across each group of subjects and activity types of the original variables taken from the initial dataset. We reproduce below the description of those variables as per the description within the original datataset

#### Original variables description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation


 
