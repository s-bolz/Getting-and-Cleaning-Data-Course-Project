Getting and Cleaning Data - course project README
---------------------------------------------------

This project is the course project of the MOOC (massive open online course) [Getting and Cleaning Data](https://www.coursera.org/course/getdata) which is offered by the [Johns Hopkins Bloomberg School of Public Health](http://www.jhsph.edu/) and distributed via [Coursera](https://www.coursera.org/). It takes the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository and transforms the data into a tidy data set. That data set is written into the file **tidy-dataset.txt**.

Prerequisites for the script run_analysis.R
---------------------------------------------------

The project consists of a single R script **run_analysis.R** which creates the tidy data set. The only prerequisites for the script are

- the downloaded and extracted [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- a running installation of R
- the installation of the additional R library reshape2

Running the script run_analysis.R
---------------------------------------------------

To create the tidy data set you need to do the following:

1. download the raw data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. unzip the downloaded file
3. open a terminal and change into the directory that contains the unzipped subdirectory **UCI HAR Dataset**
4. run the R script **run_analysis.R** from within the directory into which you just navigated, e.g. ```Rscript run_analysis.R```

When the script has finished you can find the tidy data set in a file called **tidy-dataset.txt** in the directory from which you started the script.

Workflow of the script run_analysis.R
---------------------------------------------------

The script does the following (quoted from the Coursera course project assignment):

>
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The tidy data set is written into the file **tidy-dataset.txt** in the directory where the script has been started.