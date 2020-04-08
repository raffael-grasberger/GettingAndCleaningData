library(dplyr)

X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

features <- read.table("features.txt", colClasses = "character")
features$V1 <- as.integer(features$V1)
columnIndizes <- grep("[Mm]ean|std", features$V2)
columnNames <- features[columnIndizes,2]

X_merged <- X_merged[,columnIndizes]
names(X_merged) <- columnNames

activity_labels <- read.table("activity_labels.txt")
Y_merged_labels <- left_join(Y_merged, activity_labels, by = "V1")

mergedData <- cbind(X_merged, Y_merged_labels$V2, subject_merged$V1)
colnames(mergedData)[87] <- "ACTIVITY"
colnames(mergedData)[88] <- "SUBJECT"

tidyData <- mergedData %>% group_by(ACTIVITY, SUBJECT) %>% summarise_all(.funs = mean)