#Coursera 'Getting and Cleaning Data' Project Assignment

This repository contains the R script called 'run_analysis.R' used to process data as described in the codebook.

In order to run the script:

1. Download it from this repo
2. Modify the first section of the script in order to configure the location of the data files within your working directory.
3. Run the script.

The script output is a file called 'activitytidy.txt' containing the summary file as described in the codebook

This script expects the initial data to be already downloaded and unzipped.

### Dependencies:

This script uses *'dplyer'* package

### Script step by step description:

The script performs the following transformations:

1. Merge test and train datasets in a single unified dataset containing all the original meassurements
2. Add the column names to the unified dataset by reading them from 'features.txt' file
3. Obtain a new dataset by filtering out all the columns not containing the words 'mean' or 'std' in their names
4. Add a new column to the unified dataset containing the activity_id for each of the rows. Information taken from 'y_test.txt' and 'y_train.txt' files
5. Add a new column to the unified dataset containing the text description of the activities by performing a join between the unified dataset and the information contained within the 'activity_types' file
6. Add a new column to the unified dataset containing the subject ids as per the information present in the 'subject_test.txt' and 'subject_train.txt' files.
7. Group unified dataset by subject and activity_description
8. Calculate group average for all the variables within the unified dataset


