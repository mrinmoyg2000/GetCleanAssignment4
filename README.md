# GetCleanAssignment4
#Following is a description (and explanation) of the different steps in the script run_analysis.R to accomplish the five #tasks that it #is required to do as part of the assignment #4 of Getting and Cleaning Data by Coursera. Here any line #starting with # #sign is not part of the code.

#For the run_analysis.R script to work properly it should do the following:
#1.	Merges the training and the test sets to create one data set.
#2.	Extracts only the measurements on the mean and standard deviation for each measurement.
#3.	Uses descriptive activity names to name the activities in the data set
#4.	Appropriately labels the data set with descriptive variable names.
#5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each #activity and each subject.

#Following is the description as to how the run_analysis (referred to as "the script") accomplishes all the tasks it is #required to do.
 
#The script makes use of three packages, plyr (to change the names of the factorlevels), tidyr (to tidy the dataset) and #dplyr(to get the average of each variable for each activity and each subject).
 
#load three libraries to be used for this assignment
library(plyr)
library(tidyr)
library(dplyr)

#Read the files for training set and the features. I have downloaded the zip file of the original dataset and then #unzipped #and placed the folder on the desktop and made it the working directory. The data is located primarily in two #subfolders #"train" and "test". Other relevant dataset is the features.txt located in the main folder. So the first step #for the# #script is to read the relevant files and store them in properly named objects (e.g. "train", "activity1" etc.). #Train and test folders contain similar files and so the operations on train set of data is the same as on test set. Here #I will #explain what the script does to the train set, for the test set script does the same.  

#After reading the dataframes, the script uses features.txt dataset to name the columns of train dataframe. Then convert #the activity levels into factor variable and using plyr package changes the activity levels from "1", "2", "3", "4", "5", #and "6" to "Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing" and "Laying" respectively. After #that the script changes the column names of subject (give a column name to be more accurate "Subject_ID") and activity #levels ("Activity"). Then merge the two single column dataframes of subject1 and activit1 to train dataframe (561 columns) #using cbind function. This result in a dataframe with the dimension 7352 x 563.

#Same set of actions were carried out with test set of data. That result in a dataframe with the dimension 2947 x 563

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

#Merging the training set of the datasets

merge1 <- cbind(subject1, activity1, train)

#Follow the same set of actions for the "test" set of data

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

#Now merge the two datasets

merged <- rbind(merge1, merge2)

#Extract the columns with only the mean and std measurements. Here it was not clear if only the mean() and std () of the #measurements to be extracted or any measurements with the word "mean" in it to be extracted along with std(). Here I have #used the latter i.e. any measurement/column names of the merged dataset that has std() or the word "mean" in it. The #extraction resulted in a dataframe with the dimension of 10299 x  88. If I only wanted mean() and std(), the resulting #dataset would have the dimension of 10299 x 68. To extract only mean() and std(), I would have changed the code from #"short <-grep###("mean|std", names(merged), ignore.case = TRUE)" to "short <- grep("/bmean|std/b", names(merged), #ignore.case = TRUE). The rest would have remained the same.

short <-grep("mean|std", names(merged), ignore.case = TRUE)

extracted <- merged[, c("Subject_ID", "Activity", names(merged)[short])]

#tidying the dataset by converting the wide form into long form using the package tidyr. Here I used the pipe operator %>#%. I gathered 86 measurement columns and converted them into rows with the column name (key) being "Measurement". Here I #gathred everything except "Subject_ID" and "Activity".  

tidied <- extracted%>% gather(Measurement, value, -Subject_ID, -Activity)

#arranging the data by Subject_ID, Activity, then Measurement

arranged <- tidied%>%arrange(Subject_ID, Activity,Measurement)

#then group the data by Subject_ID, Activity, Measurement

grouped <-arranged %>% group_by(Subject_ID, Activity, Measurement)

#Finally then summarize the data to get average value of each measurement/variable for each subject and for each activity

final <- grouped %>% summarise(Average = mean(value))


  


