Code Book
========================================================

This code book describes the variables, the data, and any transformations or work that I performed to clean up the smartphone accelerometer data used for the Peer Assessment assignment for the Johns Hopkins *Getting and Cleaning Data* course on Coursera.

The assignment was to download a zip file from the UC Irvine machine learning data archives, containing data from experiments with 30 volunteers who wore Samsung smartphones while performing six simple activities (standing, sitting, laying[sic], walking, walking up stairs, and walking down stairs). The sensor signals from the phones were preprocessed as described in [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the resulting data split into training and test data sets and zipped up along with several descriptive and metadata files. 

Once we had downloaded and unzipped this zip file, we were to create an R script (run_analysis.R; also included in this github repo) that does the following:

1. Uses descriptive activity names to name the activities in the data set
2. Appropriately labels the data set with descriptive activity names. [I took this instruction as a typo, assuming the instructor instead meant we needed to have column names for the dataset, identifying the variables measured by the phone's sensors -- variable names, not activity names]
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Merges the training and the test sets to create one data set.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The instructions were given in a different order; I have reordered them to show the sequence I followed to produce the result.

##0. Downloading and reading in the files
I found there were folders for test and training data, each containing three key files: one identifying the subjects, one identifying the activity the subjects were performing at each observation, and a larger one with the values for each variable measured by the phone's sensors (post-processing). 

The enclosing folder contained a file mapping label codes to the activities subjects performed (activity_labels.txt), a file mapping the variables measured by the phone's sensors (features.txt), and two informative files explaining the data.

I downloaded and read in the six files in the test and train folders, as well as the two mapping files.

##1. Naming the activities
I merged the activity data with the activity mapping file ("activity.labels.txt") to create dataframes for test and train identifying the name of the activity for each observation.

##2. Adding column names
I added a column name of "Subject" to the subject dataframe and then assigned the data in the variable mapping file (features.txt) to as column names for the main test and train dataframes.

##3. Selecting only the mean and standard deviation measures


For the purposes of this analysis, the variables were defined as...