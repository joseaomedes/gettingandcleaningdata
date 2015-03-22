
# 
# Runs analysis on activity data collected from mobile devices
#

  library(dplyr)
  
  # Dataset Files and Directories
  headerf <- "Assignment_Dataset/features.txt"
  testf <- "Assignment_Dataset/test/X_test.txt"
  trainf <- "Assignment_Dataset/train/X_train.txt"
  testtypef <- "Assignment_Dataset/test/y_test.txt"
  traintypef <- "Assignment_Dataset/train/y_train.txt"
  acttypesf <- "Assignment_Dataset/activity_labels.txt"
  subjtestf <- "Assignment_Dataset/test/subject_test.txt"
  subjtrainf <- "Assignment_Dataset/train/subject_train.txt"
    
  
  # Load headers
  header <- read.table(headerf, stringsAsFactors = F)
  titles <- header[,2]
  
  # Load Information files
  test <- read.table(testf)
  train <- read.table(trainf)
  
  # Create a join dataset containing info from test and train datasets
  total <- rbind(test,train)
  
  # Assing column names
  names(total) <-titles

  # Filter only the variables containing (mean or std)
  # Filtering is performed by finding the patters mean or std in the titles vector. 
  # Function grep returns the indexes of the appropiate vector positions
  
  meancolumns <- grep("mean", titles)
  stdcolumns <- grep("std", titles)
  
  relevantcol <- sort(c(meancolumns, stdcolumns))
  
  # Actual filtering
  totalfilt <- total[,relevantcol]
  
  # Load activity types for test and train datasets and merge them
  testtype <- read.table(testtypef)
  traintype <- read.table(traintypef)
  totaltype <- rbind(testtype,traintype)
  
  # Add a new column to the dataset including the type of activity in a numeric scheme
  totalfilt$activity_ID <- totaltype$V1
  
  # Load activity types descriptions
  acttypes <- read.table(acttypesf)
  names(acttypes) <- c("activity_ID", "activity_Description")
  
  # Join activity information and activity types descriptions in order to have a textual description within the table
  mergedData <- merge(totalfilt,acttypes, by.x="activity_ID", by.y="activity_ID", all=T)
  mergedData <- select(mergedData, -activity_ID)
    
  # Load Subject Information and create a new dataset column containing this information
  subjtest <- read.table(subjtestf)
  subjtrain <- read.table(subjtrainf)
  subjects <- rbind(subjtest, subjtrain)
  mergedData$subjects <- subjects$V1
  
  # 
  # Getting groupèd and summarized information (Using dplyr package)
  #
  
  # Group
  gData <- group_by(mergedData, subjects, activity_Description)
  
  # Calculate average for each variable
  gDataAvg <- summarise_each(gData, funs(mean))
  
  # Write resulting dataset to working directory
  write.table(gDataAvg,"activitytidy.txt",row.names = F)

  
  
  
  
  


