Code Book
========================================================

This code book describes the variables, the data, and any transformations or work that I performed to clean up the smartphone accelerometer and gyroscope data used for the Peer Assessment assignment for the Johns Hopkins *Getting and Cleaning Data* course on Coursera.

The assignment was to download a zip file from the UC Irvine machine learning data archives, containing data from experiments with 30 volunteers who wore Samsung smartphones while performing six simple activities (standing, sitting, laying[sic], walking, walking up stairs, and walking down stairs). The sensor signals from the phones were preprocessed as described in [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the resulting data split into training and test data sets and zipped up along with several descriptive and metadata files. 

Once we had downloaded and unzipped this zip file, we were to create an R script (run_analysis.R; also included in this github repo) that does the following:

1. Uses descriptive activity names to name the activities in the data set
2. Appropriately labels the data set with descriptive activity names. [I took this instruction as a typo, assuming the instructor instead meant we needed to have column names for the dataset, identifying the variables measured by the phone's sensors -- variable names, not activity names]
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Merges the training and the test sets to create one data set.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The instructions were given in a different order; I have reordered them to show the sequence I followed to produce the result.

##Data and Transformations

###Downloading and reading in the files
I found there were folders for test and training data, each containing three key files: one identifying the subjects, one identifying the activity the subjects were performing at each observation, and a larger one with the values for each variable measured by the phone's sensors (post-processing). 

The enclosing folder contained a file mapping label codes to the activities subjects performed (activity_labels.txt), a file mapping the variables measured by the phone's sensors (features.txt), and two informative files explaining the data.

I downloaded and read in the six files in the test and train folders, as well as the two mapping files.

###1. Naming the activities
I merged the activity data with the activity mapping file ("activity.labels.txt") to create dataframes for test and train identifying the name of the activity for each observation.

###2. Adding column names
I added a column name of "Subject" to the subject dataframe and then assigned the data in the variable mapping file (features.txt) to as column names for the main test and train dataframes.

###3. Selecting only the mean and standard deviation measures
The assignment called for extracting only "the measurements on mean and standard deviation for each measurement". For the purposes of this analysis, I took this to mean that we were to use only the variables defined as means and standard deviations of the various measurements. Based on the descriptions of the 561 variables used in the study, I determined that the mean measures all contained the string "mean()" in their names, and the standard deviation measures all contained the string "std()" in their names. I used the grep function to create a selection vector and used this selection vector to subset the test and train datasets. This creates a set of 79 variables, which are described here, below the process documentation.

###4. Combining the train and test data into a single dataset
I used cbind to create train and test dataframes with the subject identifier as the first column, then the 79 selected variables, and finally the activity.

I added an identifier called Type to mark each observation as originally belonging to the test or train datasets (in case we ever need to know), then used rbind to combine the train and test datasets into a single dataframe.

###5. Creating a summary containing the average of each variable for each activity and each subject
I used the melt function (from the reshape2 package) to create a very tall, narrow dataframe showing the value for each variable by activity and subject. I then used the cast function to create a summary dataframe showing the mean of each variable, split out by activity and subject. With the write.table function I wrote this summary to a text file, to be uploaded into the github repo that also contains this code book. 


##Selected Variables

The summary table (output of this exercise) has 81 variables. Acknowledgment: Descriptions of the 3rd through 81st variables are taken from the features_info file included in the zip file downloaded for this assignment. (1)

###Activity
Text string with six levels: standing, sitting, laying[sic], walking, walking up stairs, and walking down stairs.

###Subject
An integer between 1 and 30 identifying the volunteer performing the activity at each observation. Not all volunteers seem to have performed each of the six activities.

###Features (variables 3-81)
Numeric value between -1 and 1 representing the accelerometer and gyroscope values captured from the smartphone's sensors.

From the informative text included with the dataset: 

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ

> tGravityAcc-XYZ

> tBodyAccJerk-XYZ

> tBodyGyro-XYZ

> tBodyGyroJerk-XYZ

> tBodyAccMag

> tGravityAccMag

> tBodyAccJerkMag

> tBodyGyroMag

> tBodyGyroJerkMag

> fBodyAcc-XYZ

> fBodyAccJerk-XYZ

> fBodyGyro-XYZ

> fBodyAccMag

> fBodyAccJerkMag

> fBodyGyroMag

> fBodyGyroJerkMag

The set of variables that were estimated, and then selected for this analysis, from these signals are: 

mean(): Mean value

std(): Standard deviation



###Citations
(1) Descriptions of measurement features used in this analysis. "features_info.txt", part of Dataset.zip downloaded from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on 18 April 2014.







