# load necessary additional libraries
library(reshape2)

# 1. step: transform the variable names of the feature vector so that they are
#          understandable and valid for further usage in data frames

# read all variable names of the features vector - they are located in a simple
# text file consisting of two fields separated by a blank (" ") with the second
# field being the feature name
lines <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep = " ")
features <- lines[, 2]
# remove every parenthesis
features <- gsub("[()]", "", features)
# replace every hyphen (-) and every comma (,) with an underscore (_)
features <- gsub("[-,]", "_", features)
# translate leading t character into the word "time" and every leading f
# character into the word "frequency"
features <- gsub("^f", "frequency_", gsub("^t", "time_", features))

# 2. step: merge the training and the test sets and subset the relevant
#          fields (i.e. the means and standard deviations)

# read the training and the test sets - both consist of 561 fields with each
# field having a length of 8 characters
trainX <- read.fwf("UCI HAR Dataset/train/X_train.txt", rep(16, 561))
testX <- read.fwf("UCI HAR Dataset/test/X_test.txt", rep(16, 561))
# merge both sets by appending the rows of the test set after the last row of
# the training set
X <- rbind(trainX, testX)
# set the variable names for the merged data set to the transformed variable
# names from step 1
names(X) <- features
# subset the relevant fields - i.e. only those whose name consists of the word
# mean or whose name contains an abbreviation of standard deviation (std or
# dev)
relevantAttributes <- grep("(mean|std|dev)", features)
meanAndStdDev <- X[, relevantAttributes]

# 3. step: merge the subjects of the training and the test data sets

# read the subjects for the training and the test data sets - both are simple
# text files consisting of one numeric field (the subject_id) per line
subjectTrain <- as.numeric (
    readLines("UCI HAR Dataset/train/subject_train.txt")
)
subjectTest <- as.numeric(readLines("UCI HAR Dataset/test/subject_test.txt"))
# merge both subject sets by appending the rows of the test subjects after the
# last row of the training subjects
subject <- c(subjectTrain, subjectTest)

# 4. step: merge the activity labels of the training and the test sets

# read the activity labels for the training and the test data sets - both are
# simple text files consisting of one numeric field (the activity_id) per line
trainY <- as.numeric(readLines("UCI HAR Dataset/train/y_train.txt"))
testY <- as.numeric(readLines("UCI HAR Dataset/test/y_test.txt"))
# merge both activity sets by appending the rows of the test activities after
# the last row of the training activities
Y <- c(trainY, testY)

# 5. step: merge the features, subjects and activities and translate the
#          activity_id's into descriptive activity labels

# merge the results of the steps 2, 3, and 4 column-wise - i. place the
# activities as a new column after the subjects and the features as new
# columns after the activities
data <- cbind(subject_id = subject, activity_id = Y, meanAndStdDev)
# read the activity labels - they are located in a simple text file consisting
# of two fields separated by a blank (" ") with the first field being the
# activity_id and the second field being the activity name
activities <- read.table (
    file      = "UCI HAR Dataset/activity_labels.txt",
    header    = FALSE, sep = " ",
    col.names = c("activity_id", "activity")
)
# join the merged data set with the activity names using the activity_id as the
# join key
withActivityLabels <- merge(data, activities, by.x = 2, by.y = 1)

# 6. step: calculate the mean of each feature for each activity and each
#          subject

# reshape the data set by melting it with the activities and the subjects being
# the ids and the features being the measure variables
ids <- c("activity", "subject_id")
dataMelt <- melt (
    data         = withActivityLabels,
    id           = ids,
    measure.vars = features[relevantAttributes]
)
# recast the melted data set - group by the activity and by the subject_id and
# aggregate the measure variables by taking their mean
means <- dcast(dataMelt, activity + subject_id ~ variable, mean)
# rename all the feature fields by adding a leading average_ to each features
# field name
names(means) <- c (
    ids,
    paste("average_", features[relevantAttributes], sep = "")
)

# 7. step: write the tidy data set to disk

# remove already existing file if found
tidyDatasetFileName <- "tidy-dataset.txt"
if (file.exists(tidyDatasetFileName)) {
  file.remove(tidyDatasetFileName)
}
# write the tidy data set into a txt file
write.table(means, file = tidyDatasetFileName, sep = "\t", row.names = FALSE)
