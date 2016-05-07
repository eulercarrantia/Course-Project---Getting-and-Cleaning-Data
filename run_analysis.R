

# 1.Merges the training and the test sets to create one data set.

test_data <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
test_label <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="", col.names = "label")
test_subject <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="", col.names = "subject")

train_data <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
train_label <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="", col.names ="label")
train_subject <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="", col.names = "subject")

test <- cbind(test_subject, test_label, test_data)
train <- cbind(train_subject, train_label, train_data)
merge_data <- rbind(train, test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.

features <-  read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
features_mean_std <- features[grep("mean|std",features$V2),]

data_mean_std <- merge_data[,c(1,2,features_mean_std$V1+2)] 
# +2 is because the first two columns are the subject and label, and then we have to move 2 positions the variables of the data set.


# 3.Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("~/Data Science - Coursera/Getting cleaning data/Course Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
data_mean_std$label <- activity_labels[data_mean_std$label,"V2"]


# 4. Appropriately labels the data set with descriptive variable names.

names_features <- gsub("[^[:alpha:]]", "", features_mean_std$V2) # remove things that are not letters
tidy_names <- c("subject", "label", names_features)
colnames(data_mean_std) <- tidy_names

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
# each activity and each subject.

data_mean_activity_subject <- aggregate(data_mean_std[, 3:ncol(data_mean_std)],
                       by=list(subject = data_mean_std$subject, 
                               label = data_mean_std$label),
                       mean)

# tidy data to submit

final_data <- write.table(data_mean_activity_subject, "~/Data Science - Coursera/Getting cleaning data/Course Project/final_data.txt", row.names = FALSE)
