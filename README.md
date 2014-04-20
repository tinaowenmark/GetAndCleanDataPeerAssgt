README: Smartphone Accelerometer Data Collection and Cleanup
============================================================

One of the most exciting areas in all of data science right now is wearable computing - see for example the article at http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



In this repository is an R script called [run_analysis.R](https://github.com/tinaowenmark/GetAndCleanDataPeerAssgt/blob/master/run_analysis.R) that does the following:

*    Merges the training and the test sets to create one data set.
*    Extracts only the measurements on the mean and standard deviation for each measurement. 
*    Uses descriptive activity names to name the activities in the data set
*    Appropriately labels the data set with descriptive activity names. 
*    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The independent tidy data set referenced above is included in this repo, in a file called [summary.txt](https://github.com/tinaowenmark/GetAndCleanDataPeerAssgt/blob/master/summary.txt).

Additionally, I've created a code book, called [CodeBook.md](https://github.com/tinaowenmark/GetAndCleanDataPeerAssgt/blob/master/CodeBook.md), describing the variables, the data, and the transformations and work that I performed to clean up the data.
