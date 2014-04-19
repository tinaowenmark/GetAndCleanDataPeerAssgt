Code Book
========================================================

This code book describes the variables, the data, and any transformations or work that I performed to clean up the smartphone accelerometer data used for the Peer Assessment assignment for the Johns Hopkins *Getting and Cleaning Data* course on Coursera.

The assignment was to download a zip file from the UC Irvine machine learning data archives, containing data from experiments with 30 volunteers who wore Samsung smartphones while performing six simple activities (standing, sitting, laying[sic], walking, walking up stairs, and walking down stairs). The sensor signals from the phones were preprocessed as described in [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the resulting data split into training and test data sets and zipped up along with several metadata files. 

Once we had downloaded and unzipped this zip file, we were to create an R script (run_analysis.R; also included in this github repo) that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


For the purposes of this analysis, the variables were defined as...