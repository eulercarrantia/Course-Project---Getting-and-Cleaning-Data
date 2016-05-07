# Course-Project---Getting-and-Cleaning-Data

This repository contains 3 files:

1. README.md
2. CodeBook.md
3. run_analysis.R

The run_analysis.R contains the code which developes the tasks of this project. There are 5 tasks:

1. Merges the training and the test sets to create one data set.
  Here I have read test and train files and I have merged them, in order to obtain a full data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  Here I have read the features file and select the variables which are about mean and standard deviation. 

3. Uses descriptive activity names to name the activities in the data set.
Here I have read activity labels file and translate the factors of the merged file to the name of the activities.

4. Appropriately labels the data set with descriptive variable names.
Here I have cleaned the name of the variables about the mean and the standard daviation, and put together all of the name of the variables.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Through the "aggregate" function, I have splited the data into activities and subject, and I have calculated the mean for each of them.
