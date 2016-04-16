#load three libraries to be used for this assignment
library(plyr)
library(tidyr)
library(dplyr)

#Read the files for training set and the features

train <-read.table("./train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
activity1 <- read.table("./train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
subject1 <- read.table("./train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
features <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE)
#Using the feature list to name the columns of "train" dataframe
colnames(train) <- features$V2


#Converting the activity into factor variable
activity1$V1 <- factor(activity1$V1)

#Changing the activity levels into descriptive names like "Walking", "Walking_Upstairs" etc.
factor1 <- levels(activity1$V1)
factor2 <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
activity1$V1 <- mapvalues(activity1$V1, from = factor1, to = factor2)

#Changing the column names of subject1 and activity1
colnames(subject1) <-"Subject_ID"
colnames(activity1) <- "Activity"

#merging the training set of the datasets
merge1 <- cbind(subject1, activity1, train)

#follow the same set of actions for the "test" set of data
test <- read.table("./test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
activity2 <- read.table("./test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
subject2 <- read.table ("./test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(test) <- features$V2
activity2$V1 <- factor(activity2$V1)
factor3 <- levels(activity2$V1)
factor4 <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
activity2$V1 <- mapvalues(activity2$V1, from = factor3, to = factor4)
colnames(subject2) <- "Subject_ID"
colnames(activity2) <- "Activity"
merge2 <- cbind(subject2, activity2, test)

#now merge the two datasets

merged <- rbind(merge1, merge2)

#extract the columns with only the mean and std measurements

short <-grep("mean|std", names(merged), ignore.case = TRUE)

extracted <- merged[, c("Subject_ID", "Activity", names(merged)[short])]

#tidying the dataset by converting the wide form into long form using the package tidyr
tidied <- extracted%>% gather(Measurement, value, -Subject_ID, -Activity)

#arranging the data by Subject_ID, Activity, then Measurement
arranged <- tidied%>%arrange(Subject_ID, Activity,Measurement)

#then group the data by Subject_ID, Activity, Measurement

grouped <-arranged %>% group_by(Subject_ID, Activity, Measurement)

#then summarize the data to get average value of each measurement for each subject and for each activity

final <- grouped %>% summarise(Average = mean(value))

  


