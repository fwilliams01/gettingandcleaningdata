# gettingandcleaningdata
The run_analysis.R file reads data from the Human Activity Recognition database. This database was built from experiment of a group of 30 volunteers within an age bracket of 19-48. Each volunteer performed six activities while wearing a Samsung Galaxy S II smartphone on the waist: walking, sitting standing, laying, walking upstairs and walking downstairs. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
-	For each record in the dataset it is provided: 
    Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
    Triaxial Angular velocity from the gyroscope. 
    A 561-feature vector with time and frequency domain variables.
    Its activity label.
    An identifier of the subject who carried out the experiment.
    
    
-	The following datasets were provided:
    'features_info.txt': Shows information about the variables used on the feature vector.
    'features.txt': List of all features.
    'activity_labels.txt': Links the class labels with their activity name.
    'train/X_train.txt': Training set.
    'train/y_train.txt': Training labels.
    'test/X_test.txt': Test set.
    'test/y_test.txt': Test labels.
    'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The R script called run_analysis.R does the following. 
1.	Reads the data from the database website.
2.	Read in the X, Y, and Subject training and test data.
3.	Create a dataframe for the 6 activities that the volunteers completed.
4.	Label the variables for the test, train and subject data files.
5.	Merges the training and the test sets to create one data set.
6.	Extracts only the measurements on the mean and standard deviation for each measurement. 
7.	Uses descriptive activity names to name the activities in the data set
8.	Appropriately labels the data set with descriptive variable names. 
9.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
