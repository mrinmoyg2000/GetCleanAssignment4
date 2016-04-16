			Getting and Cleaning Data: Assigngment #4

The data and other relevant information for this assignment obtained from the following (Anguita et al. 2012, Anguita et al. 2013) 
The original dataset is referred to as "original dataset" and the new dataset prepared as per the instruction for this project in the assingment #4 of Getting and Cleaning Data is referred to as "modified dataset".

		Human Activity Recognition Using Smartphones Dataset
				Version 1.0
		==================================================================
		Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
		Smartlab - Non Linear Complex Systems Laboratory
		DITEN - Università degli Studi di Genova.
		Via Opera Pia 11A, I-16145, Genoa, Italy.
		activityrecognition@smartlab.ws
		www.smartlab.ws
		==================================================================

The Codebook: 

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. 

The measurements selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd orderlow pass Butterworth filter with a corner frequency of 20 Hz to remove noise and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of measurements was obtained by calculating variables from the time and frequency domain.


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

  
These signals were used to estimate variables of the measurement vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMa


In the modified dataset, the set of variables that were shown as estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Notes: 
======
- Measurements are normalized and bounded within [-1,1].

- Please note that the original dataset contained the following files:

-  README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

For more information about the original dataset contact: activityrecognition@smartlab.ws


Following are the transformation done to the original datasets to make the modified dataset: 

As per the instruction for this project the dataset of both train and test as well as activity labels( training and test labels) and subject are merged into one single dataset after the activity labels changed from numeric ("1", "2", "3", ..etc.) to descriptive labels ("Walking", "Walking_Upstairs"..etc.) and the dataset given proper column names. Then the dataset which has 563 columns, 561 are columns of features from which only those featueres were extracted which measues the mean or the standard deviation as noted above (total 86 measurments). Following that the data was tidied using tidyr to convert a wide dataframe into a long dataframe with four columns: "Subject_ID", "Activity", "Measurement", "Value". Subesquently the dataframe is further modified using the dplyr package to get the average of each measurement for each subject for each activity.


In the modified data:

Subject_ID: Identifier for each subject in this experiment, it ranges from 1 to 30.

Activity: Activity performed by each subject. There were six activities: "Walking", "Walking_Upsstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying".

Measurements: Total 86 measurements/variable

 [1] "tBodyAcc-mean()-X"                   
 [2] "tBodyAcc-mean()-Y"                   
 [3] "tBodyAcc-mean()-Z"                   
 [4] "tBodyAcc-std()-X"                    
 [5] "tBodyAcc-std()-Y"                    
 [6] "tBodyAcc-std()-Z"                    
 [7] "tGravityAcc-mean()-X"                
 [8] "tGravityAcc-mean()-Y"                
 [9] "tGravityAcc-mean()-Z"                
[10] "tGravityAcc-std()-X"                 
[11] "tGravityAcc-std()-Y"                 
[12] "tGravityAcc-std()-Z"                 
[13] "tBodyAccJerk-mean()-X"               
[14] "tBodyAccJerk-mean()-Y"               
[15] "tBodyAccJerk-mean()-Z"               
[16] "tBodyAccJerk-std()-X"                
[17] "tBodyAccJerk-std()-Y"                
[18] "tBodyAccJerk-std()-Z"                
[19] "tBodyGyro-mean()-X"                  
[20] "tBodyGyro-mean()-Y"                  
[21] "tBodyGyro-mean()-Z"                  
[22] "tBodyGyro-std()-X"                   
[23] "tBodyGyro-std()-Y"                   
[24] "tBodyGyro-std()-Z"                   
[25] "tBodyGyroJerk-mean()-X"              
[26] "tBodyGyroJerk-mean()-Y"              
[27] "tBodyGyroJerk-mean()-Z"              
[28] "tBodyGyroJerk-std()-X"               
[29] "tBodyGyroJerk-std()-Y"               
[30] "tBodyGyroJerk-std()-Z"               
[31] "tBodyAccMag-mean()"                  
[32] "tBodyAccMag-std()"                   
[33] "tGravityAccMag-mean()"               
[34] "tGravityAccMag-std()"                
[35] "tBodyAccJerkMag-mean()"              
[36] "tBodyAccJerkMag-std()"               
[37] "tBodyGyroMag-mean()"                 
[38] "tBodyGyroMag-std()"                  
[39] "tBodyGyroJerkMag-mean()"             
[40] "tBodyGyroJerkMag-std()"              
[41] "fBodyAcc-mean()-X"                   
[42] "fBodyAcc-mean()-Y"                   
[43] "fBodyAcc-mean()-Z"                   
[44] "fBodyAcc-std()-X"                    
[45] "fBodyAcc-std()-Y"                    
[46] "fBodyAcc-std()-Z"                    
[47] "fBodyAcc-meanFreq()-X"               
[48] "fBodyAcc-meanFreq()-Y"               
[49] "fBodyAcc-meanFreq()-Z"               
[50] "fBodyAccJerk-mean()-X"               
[51] "fBodyAccJerk-mean()-Y"               
[52] "fBodyAccJerk-mean()-Z"               
[53] "fBodyAccJerk-std()-X"                
[54] "fBodyAccJerk-std()-Y"                
[55] "fBodyAccJerk-std()-Z"                
[56] "fBodyAccJerk-meanFreq()-X"           
[57] "fBodyAccJerk-meanFreq()-Y"           
[58] "fBodyAccJerk-meanFreq()-Z"           
[59] "fBodyGyro-mean()-X"                  
[60] "fBodyGyro-mean()-Y"                  
[61] "fBodyGyro-mean()-Z"                  
[62] "fBodyGyro-std()-X"                   
[63] "fBodyGyro-std()-Y"                   
[64] "fBodyGyro-std()-Z"                   
[65] "fBodyGyro-meanFreq()-X"              
[66] "fBodyGyro-meanFreq()-Y"              
[67] "fBodyGyro-meanFreq()-Z"              
[68] "fBodyAccMag-mean()"                  
[69] "fBodyAccMag-std()"                   
[70] "fBodyAccMag-meanFreq()"              
[71] "fBodyBodyAccJerkMag-mean()"          
[72] "fBodyBodyAccJerkMag-std()"           
[73] "fBodyBodyAccJerkMag-meanFreq()"      
[74] "fBodyBodyGyroMag-mean()"             
[75] "fBodyBodyGyroMag-std()"              
[76] "fBodyBodyGyroMag-meanFreq()"         
[77] "fBodyBodyGyroJerkMag-mean()"         
[78] "fBodyBodyGyroJerkMag-std()"          
[79] "fBodyBodyGyroJerkMag-meanFreq()"     
[80] "angle(tBodyAccMean,gravity)"         
[81] "angle(tBodyAccJerkMean),gravityMean)"
[82] "angle(tBodyGyroMean,gravityMean)"    
[83] "angle(tBodyGyroJerkMean,gravityMean)"
[84] "angle(X,gravityMean)"                
[85] "angle(Y,gravityMean)"                
[86] "angle(Z,gravityMean)"                
 

Average: Average for each measurement for each subject for each activity.


A full description of the original experiment is available at the site where the data (original datasets) was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

data for the project of Assignment 4:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

