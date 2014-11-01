#Merge training and test sets to create one data set
dataLocation <- "UCI HAR Dataset/"
testTable <- "test/X_test.txt"
testSubjectTable <- "test/subject_test.txt"
testLabelsTable <- "test/y_test.txt"
trainTable <- "train/X_train.txt"
trainSubjectTable <- "train/subject_train.txt"
trainLabelsTable <- "train/y_train.txt"
featuresTable <- "features.txt"
activityLabelsTable <- "activity_labels.txt"
tidyDataTable <- "samsumg_data_means.txt"

#Read in tables
#Features
features <- read.table(paste0(dataLocation, featuresTable))
names(features) <- c("feature_label", "feature")

#Activities
activities <- read.table(paste0(dataLocation, activityLabelsTable))
names(activities) <- c("activity_label", "activity")

#Test dataset
#Test features
test <- read.table(paste0(dataLocation, testTable))
names(test) <- features$feature
#Test subjects
test$subject_label <- read.table(paste0(dataLocation, testSubjectTable))[[1]]
#Test activity labels
test$activity_label <- read.table(paste0(dataLocation, testLabelsTable))[[1]]
#Dataset type
test$dataset <- "test"

#Train dataset
#Train features
train <- read.table(paste0(dataLocation, trainTable))
names(train) <- features$feature
#Train subjects
train$subject_label <- read.table(paste0(dataLocation, trainSubjectTable))[[1]]
#Test activity labels
train$activity_label <- read.table(paste0(dataLocation, trainLabelsTable))[[1]]
#Dataset type
train$dataset <- "train"

#Merged dataset
dataset <- rbind(test, train) #P1

#Mean and standard deviation data
mean.std.data <- dataset[,grepl('-mean()|-std()|subject_label|activity_label|dataset', names(dataset))] #P2

#Add activity descriptions
mean.std.data <- merge(mean.std.data, activities, by = "activity_label") #P3

#Tidy data set of variable averages
library(reshape2)
variableMeans <- melt(mean.std.data, 
                      id.vars = c("subject_label", "activity_label", "activity"),
                      measure.vars = grep("-mean()", names(mean.std.data), value = TRUE))
write.table(variableMeans, file = tidyDataTable, row.name = FALSE)
