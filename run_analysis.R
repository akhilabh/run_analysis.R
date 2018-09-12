#loding required libraries
library(reshape2)


## creating one data set


subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

#  subject column name
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# measurement column name
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# label column name
names(y_train) <- "activity"
names(y_test) <- "activity"

# dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)


## mean and standard data
## deviation for each measurement.

# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
    grepl("std\\(\\)", names(combined))

meanstdcols[1:2] <- TRUE

combined <- combined[, meanstdcols]


## labelling

# convert the activity column rom integer to factor
combined$activity <- factor(combined$activity, labels=c("Walking",
    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


# clean data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

#create data set file
write.csv(tidy, "tidy.csv", row.names=FALSE)
