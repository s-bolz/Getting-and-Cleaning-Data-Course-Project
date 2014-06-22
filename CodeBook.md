Getting and Cleaning Data - course project CodeBook
---------------------------------------------------

The file **tidy-dataset.txt** contains 81 fields separated by the tabulator character. These fields have been calculated based on the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the UCI Machine Learning Repository.

Transformation Steps
---------------------------------------------------

The calculation followed these steps:

1. transform the variable names of the feature vector so that they are understandable and valid for further usage in data frames
    + read the feature names (features.txt)
    + remove every parenthesis from the feature names
    + replace every hyphen (-) and every comma (,) in the feature names with an underscore (_)
    + translate leading t character into the word "time" and every leading f character into the word "frequency"
    + replace BodyBody substrings with Body as they seem to be typos
2. merge the training and the test sets and subset the relevant fields (i.e. the means and standard deviations)
    + read the training (X_train.txt) and the test (X_test.txt) sets
    + merge both sets by appending the rows of the test set after the last row of the training set
    + set the variable names for the merged data set to the transformed variable names from step 1
    + subset the fields whose name contains either the word mean or an abbreviation of standard deviation (std or dev)
3. merge the subjects of the training and the test data sets
    + read the subjects for the training (subject_train.txt) and for the test (subject_test.txt) sets
    + merge the subjects by appending the rows of the test subjects after the last row of the training subjects
4. merge the activity labels of the training and the test sets
    + read the activity labels for the training (y_train.txt) and the test (y_test.txt) sets
    + merge the activities by appending the rows of the test activities after the last row of the training activities
5. merge the features, subjects and activities and translate the activity_id's into descriptive activity labels
    + merge the results of the steps 2, 3, and 4 column-wise - i.e. place the activities as a new column after the subjects and the features as new columns after the activities
    + read the activity label descriptions (activity_labels.txt)
    + join the merged data set with the activity names using the activity_id as the join key
6. calculate the mean of each feature for each activity and each subject
    + reshape the data set by melting it with the activities and the subjects being the ids and the features being the measure variables
    + recast the melted data set - group by the activity and by the subject_id and aggregate the measure variables by taking their mean
    + rename all the feature fields by adding a leading average_ to each feature field name
7. write the tidy data set to disk
    + remove already existing file if found
    + write the tidy data set into a txt file (tidy-dataset.txt)

Field Descriptions
---------------------------------------------------

Field Name                                     | Field Description
---------------------------------------------- | -----------------
activity                                       | performed activity during which the features have been recorded (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
subject_id                                     | an identifier of the subject for whom the features have been recorded
average_time_BodyAcc_mean_X                    | mean of all experiment means of the body acceleration time domain signals on the X-axis
average_time_BodyAcc_mean_Y                    | mean of all experiment means of the body acceleration time domain signals on the Y-axis
average_time_BodyAcc_mean_Z                    | mean of all experiment means of the body acceleration time domain signals on the Z-axis
average_time_BodyAcc_std_X                     | mean of all experiment standard deviations of the body acceleration time domain signals on the X-axis
average_time_BodyAcc_std_Y                     | mean of all experiment standard deviations of the body acceleration time domain signals on the Y-axis
average_time_BodyAcc_std_Z                     | mean of all experiment standard deviations of the body acceleration time domain signals on the Z-axis
average_time_GravityAcc_mean_X                 | mean of all experiment means of the gravity acceleration time domain signals on the X-axis
average_time_GravityAcc_mean_Y                 | mean of all experiment means of the gravity acceleration time domain signals on the Y-axis
average_time_GravityAcc_mean_Z                 | mean of all experiment means of the gravity acceleration time domain signals on the Z-axis
average_time_GravityAcc_std_X                  | mean of all experiment standard deviations of the gravity acceleration time domain signals on the X-axis
average_time_GravityAcc_std_Y                  | mean of all experiment standard deviations of the gravity acceleration time domain signals on the Y-axis
average_time_GravityAcc_std_Z                  | mean of all experiment standard deviations of the gravity acceleration time domain signals on the Z-axis
average_time_BodyAccJerk_mean_X                | mean of all experiment means of the body acceleration time domain jerk signals on the X-axis
average_time_BodyAccJerk_mean_Y                | mean of all experiment means of the body acceleration time domain jerk signals on the Y-axis
average_time_BodyAccJerk_mean_Z                | mean of all experiment means of the body acceleration time domain jerk signals on the Z-axis
average_time_BodyAccJerk_std_X                 | mean of all experiment standard deviations of the body acceleration time domain jerk signals on the X-axis
average_time_BodyAccJerk_std_Y                 | mean of all experiment standard deviations of the body acceleration time domain jerk signals on the Y-axis
average_time_BodyAccJerk_std_Z                 | mean of all experiment standard deviations of the body acceleration time domain jerk signals on the Z-axis
average_time_BodyGyro_mean_X                   | mean of all experiment means of the body gyroscope time domain signals on the X-axis
average_time_BodyGyro_mean_Y                   | mean of all experiment means of the body gyroscope time domain signals on the Y-axis
average_time_BodyGyro_mean_Z                   | mean of all experiment means of the body gyroscope time domain signals on the Z-axis
average_time_BodyGyro_std_X                    | mean of all experiment standard deviations of the body gyroscope time domain signals on the X-axis
average_time_BodyGyro_std_Y                    | mean of all experiment standard deviations of the body gyroscope time domain signals on the Y-axis
average_time_BodyGyro_std_Z                    | mean of all experiment standard deviations of the body gyroscope time domain signals on the Z-axis
average_time_BodyGyroJerk_mean_X               | mean of all experiment means of the body gyroscope time domain jerk signals on the X-axis
average_time_BodyGyroJerk_mean_Y               | mean of all experiment means of the body gyroscope time domain jerk signals on the Y-axis
average_time_BodyGyroJerk_mean_Z               | mean of all experiment means of the body gyroscope time domain jerk signals on the Z-axis
average_time_BodyGyroJerk_std_X                | mean of all experiment standard deviations of the body gyroscope time domain jerk signals on the X-axis
average_time_BodyGyroJerk_std_Y                | mean of all experiment standard deviations of the body gyroscope time domain jerk signals on the Y-axis
average_time_BodyGyroJerk_std_Z                | mean of all experiment standard deviations of the body gyroscope time domain jerk signals on the Z-axis
average_time_BodyAccMag_mean                   | mean of all experiment means of the body acceleration time domain magnitude signals
average_time_BodyAccMag_std                    | mean of all experiment standard deviations of the body acceleration time domain magnitude signals
average_time_GravityAccMag_mean                | mean of all experiment means of the gravity acceleration time domain magnitude signals
average_time_GravityAccMag_std                 | mean of all experiment standard deviations of the gravity acceleration time domain magnitude signals
average_time_BodyAccJerkMag_mean               | mean of all experiment means of the body acceleration time domain magnitude jerk signals
average_time_BodyAccJerkMag_std                | mean of all experiment standard deviations of the body acceleration time domain magnitude jerk signals
average_time_BodyGyroMag_mean                  | mean of all experiment means of the body gyroscope time domain magnitude signals
average_time_BodyGyroMag_std                   | mean of all experiment standard deviations of the body gyroscope time domain magnitude signals
average_time_BodyGyroJerkMag_mean              | mean of all experiment means of the body gyroscope time domain magnitude jerk signals
average_time_BodyGyroJerkMag_std               | mean of all experiment standard deviations of the body gyroscope time domain magnitude jerk signals
average_frequency_BodyAcc_mean_X               | mean of all experiment means of the body acceleration frequency domain signals on the X-axis
average_frequency_BodyAcc_mean_Y               | mean of all experiment means of the body acceleration frequency domain signals on the Y-axis
average_frequency_BodyAcc_mean_Z               | mean of all experiment means of the body acceleration frequency domain signals on the Z-axis
average_frequency_BodyAcc_std_X                | mean of all experiment standard deviations of the body acceleration frequency domain signals on the X-axis
average_frequency_BodyAcc_std_Y                | mean of all experiment standard deviations of the body acceleration frequency domain signals on the Y-axis
average_frequency_BodyAcc_std_Z                | mean of all experiment standard deviations of the body acceleration frequency domain signals on the Z-axis
average_frequency_BodyAcc_meanFreq_X           | mean of all experiment mean frequencies of the body acceleration frequency domain signals on the X-axis
average_frequency_BodyAcc_meanFreq_Y           | mean of all experiment mean frequencies of the body acceleration frequency domain signals on the Y-axis
average_frequency_BodyAcc_meanFreq_Z           | mean of all experiment mean frequencies of the body acceleration frequency domain signals on the Z-axis
average_frequency_BodyAccJerk_mean_X           | mean of all experiment means of the body acceleration frequency domain jerk signals on the X-axis
average_frequency_BodyAccJerk_mean_Y           | mean of all experiment means of the body acceleration frequency domain jerk signals on the Y-axis
average_frequency_BodyAccJerk_mean_Z           | mean of all experiment means of the body acceleration frequency domain jerk signals on the Z-axis
average_frequency_BodyAccJerk_std_X            | mean of all experiment standard deviations of the body acceleration frequency domain jerk signals on the X-axis
average_frequency_BodyAccJerk_std_Y            | mean of all experiment standard deviations of the body acceleration frequency domain jerk signals on the Y-axis
average_frequency_BodyAccJerk_std_Z            | mean of all experiment standard deviations of the body acceleration frequency domain jerk signals on the Z-axis
average_frequency_BodyAccJerk_meanFreq_X       | mean of all experiment mean frequencies of the body acceleration frequency domain jerk signals on the X-axis
average_frequency_BodyAccJerk_meanFreq_Y       | mean of all experiment mean frequencies of the body acceleration frequency domain jerk signals on the Y-axis
average_frequency_BodyAccJerk_meanFreq_Z       | mean of all experiment mean frequencies of the body acceleration frequency domain jerk signals on the Z-axis
average_frequency_BodyGyro_mean_X              | mean of all experiment means of the body gyroscope frequency domain signals on the X-axis
average_frequency_BodyGyro_mean_Y              | mean of all experiment means of the body gyroscope frequency domain signals on the Y-axis
average_frequency_BodyGyro_mean_Z              | mean of all experiment means of the body gyroscope frequency domain signals on the Z-axis
average_frequency_BodyGyro_std_X               | mean of all experiment standard deviations of the body gyroscope frequency domain signals on the X-axis
average_frequency_BodyGyro_std_Y               | mean of all experiment standard deviations of the body gyroscope frequency domain signals on the Y-axis
average_frequency_BodyGyro_std_Z               | mean of all experiment standard deviations of the body gyroscope frequency domain signals on the Z-axis
average_frequency_BodyGyro_meanFreq_X          | mean of all experiment mean frequencies of the body gyroscope frequency domain signals on the X-axis
average_frequency_BodyGyro_meanFreq_Y          | mean of all experiment mean frequencies of the body gyroscope frequency domain signals on the Y-axis
average_frequency_BodyGyro_meanFreq_Z          | mean of all experiment mean frequencies of the body gyroscope frequency domain signals on the Z-axis
average_frequency_BodyAccMag_mean              | mean of all experiment means of the body acceleration frequency domain magnitude signals
average_frequency_BodyAccMag_std               | mean of all experiment standard deviations of the body acceleration frequency domain magnitude signals
average_frequency_BodyAccMag_meanFreq          | mean of all experiment mean frequencies of the body acceleration frequency domain magnitude signals
average_frequency_BodyAccJerkMag_mean          | mean of all experiment means of the body acceleration frequency domain magnitude jerk signals
average_frequency_BodyAccJerkMag_std           | mean of all experiment standard deviations of the body acceleration frequency domain magnitude jerk signals
average_frequency_BodyAccJerkMag_meanFreq      | mean of all experiment mean frequencies of the body acceleration frequency domain magnitude jerk signals
average_frequency_BodyGyroMag_mean             | mean of all experiment means of the body gyroscope frequency domain magnitude signals
average_frequency_BodyGyroMag_std              | mean of all experiment standard deviations of the body gyroscope frequency domain magnitude signals
average_frequency_BodyGyroMag_meanFreq         | mean of all experiment mean frequencies of the body gyroscope frequency domain magnitude signals
average_frequency_BodyGyroJerkMag_mean         | mean of all experiment means of the body gyroscope frequency domain magnitude jerk signals
average_frequency_BodyGyroJerkMag_std          | mean of all experiment standard deviations of the body gyroscope frequency domain magnitude jerk signals
average_frequency_BodyGyroJerkMag_meanFreq     | mean of all experiment mean frequencies of the body gyroscope frequency domain magnitude jerk signals
