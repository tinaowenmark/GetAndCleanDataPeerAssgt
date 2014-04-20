# This is an R script called run_analysis.R that does the following for the
# Samsung smartphone accelerometer data used in this exercise:
#         
# * Merges the training and the test sets to create one data set.
# * Extracts only the measurements on the mean and standard deviation for each 
#   measurement.
# * Uses descriptive activity names to name the activities in the data set
# * Appropriately labels the data set with descriptive activity names.
# * Creates a second, independent tidy data set with the average of each 
#   variable for each activity and each subject.


# STEP 0. INSTALL AND LOAD REQUIRED LIBRARIES
require(reshape2)

# STEP 1. DOWNLOAD AND READ IN THE DATA AND RELATED METADATA

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./data/dataset.zip"
download.file(url, destfile=destfile, method="curl")
unzip(destfile, exdir="./data")


testsubject <- read.table(file="./data/UCI HAR Dataset/test/subject_test.txt")
testdata <- read.table(file="./data/UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table(file="./data/UCI HAR Dataset/test/y_test.txt")

trainsubject <- read.table(file="./data/UCI HAR Dataset/train/subject_train.txt")
traindata <- read.table(file="./data/UCI HAR Dataset/train/X_train.txt")
trainlabels <- read.table(file="./data/UCI HAR Dataset/train/y_train.txt")

features <- read.table(file="./data/UCI HAR Dataset/features.txt")
activityLabels <- read.table(file="./data/UCI HAR Dataset/activity_labels.txt")


# STEP 2. START BUILDING DATAFRAMES FOR TEST AND TRAIN DATA COMPONENTS

# Create a label data frame that replaces numeric labels with descriptive 
# activity names.

testlabelmerge <- merge(testlabels, activityLabels,by="V1")
trainlabelmerge <- merge(trainlabels, activityLabels, by="V1")

testactivity <- data.frame(testlabelmerge[,2])
colnames(testactivity) <- "Activity"
trainactivity <- data.frame(trainlabelmerge[,2])
colnames(trainactivity) <- "Activity"

# Give column names to subject and data.
colnames(testsubject) <- "Subject"
colnames(trainsubject) <- "Subject"

colnames(testdata) <- features$V2
colnames(traindata) <- features$V2


# STEP 3. GET ONLY THE COLUMNS WE WANT
# Create subsets of the test and train data including only mean and standard
# deviation measurements 

extractvector <- grep("mean()|std()", features[,2])
testdatasub <- testdata[,extractvector]
traindatasub <- traindata[,extractvector]


# STEP 4. FINISH BUILDING THE COMPONENT DATAFRAMES
# Combine subject, data, and activity into single dataframes for test and train.

test <- cbind(testsubject, testdatasub, testactivity)
train <- cbind(trainsubject, traindatasub, trainactivity)

# Clear out items we no longer need
rm(activityLabels, testactivity, testdata, testdatasub, testlabelmerge, 
   testlabels, testsubject, trainactivity, traindata, traindatasub,
   trainlabelmerge, trainlabels, trainsubject)


# STEP 5. MERGE TRAIN AND TEST DATAFRAMES INTO ONE
# Add an identifier so we can separate them again if we want to 
test$Type <- "test"
train$Type <- "train"

# Combine the dataframes
data <- rbind(test, train)


# STEP 6. CREATE AND WRITE A SUMMARY TABLE
# This dataset will contain the average value for each of the selected (mean
# and standard deviation) variable by activity and subject

# Melt and cast the data by these two features
measure.vars <- as.character(features[extractvector,][,2])
datamelt <- melt(data, id=c("Activity", "Subject"), measure.vars=measure.vars)
summary <- dcast(datamelt, Activity + Subject ~ variable, mean)

# Write the summary to disk so I can upload it into the grader
write.table(summary, "summary.txt")
