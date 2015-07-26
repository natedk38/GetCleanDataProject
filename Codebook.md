DESCRIPTION OF THE EXPERIMENT AND RAW DATA:
The raw data contains measurements taken by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto of the Smartlab - Non Linear Complex Systems Laboratory at the University of Genoa, in Genoa, Italy.  Data was measured on a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.
Data from the experiment is contained in the zipped 'UCI HAR Dataset' folder  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), with subfolders containing the following files:
- 'README.txt' - describes the experiment and data

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

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

RESHAPING THE DATA AND CREATING A TIDY DATA SET:
Using the data described above the run_analysis.R script was written to tidy the data to a subset based on instructions from the 'Getting and Cleaning Data' course project through Coursera.

The output from the run_analysis.R script is a text file called "Tidy Project Data Set.txt". This text file contains a data.frame, grouped by subject then activity, which contains an average of the mean and standard deviation measurements for each subject and each activity.

Using R Studio (Version 0.98.1103), the following data files were consolidated and filtered to meet the requirements of the project. The '.txt' files used are - 'x_test', 'y_test', 'X_train', 'y_train', 'subject_test', 'subject_train', 'features', and 'activity_labels'. 

The tidy data set was constructed with the following steps:

1. Downloading the entire zipped data set, then
   

Note: 'meanFreq' and 'angle' variables were dropped due to not being a pure mean of the values, but rather a weighted average and an average based on a sample window, respectively. 

VARIABLE NAMES DICTIONARY:

Most of the measurement variables in the tidy data contain a column for each axis being measured (X,Y,Z), and each variable can be seen by viewing the tidy data set.  For brevity, this codebook leaves out the axis identifier and only provides the name of the variable and the description of the data associated with that variable.

Subject

Numeric range 1:30, corresponds to one of the 30 subjects in the experiment.

Activity

Character string corresponding to one of six activities of daily life measured in the experiment:

    1_WALKING - the act of walking.
    2_WALKING UPSTAIRS - the act of walking upstairs.
    3_WALKING_DOWNSTAIRS - the act of walking downstairs.
    4_SITTING - the act of sitting.
    5_STANDING - the act of standing.
    6_LAYING - the act of laying down.

tBodyAcc-

Numeric, Body acceleration time domain signal from accelerometer.       

tGravityAcc-

Numeric, Gravity acceleration time domain signal from accelerometer.    

tBodyAccJerk-

Numeric, Body jerk time domain signal from body acceleration and angular velocity.      

tBodyGyro-

Numeric, Body gyration time domain signal from gyroscope.       

tBodyGyroJerk-

Numeric, Body jerk time domain signal from gyration and angular velocity.       

tBodyAccMag

Numeric, Magnitude of body acceleration time domain signal from accelerometer.  

tGravityAccMag

Numeric, Magnitude of gravity acceleration time domain signal from accelerometer.       

tBodyAccJerkMag

Numeric, Magnitude of body jerk time domain signal from acceleration and angular velocity.      

tBodyGyroMag

Numeric, Magnitude of body gyration time domain signal from gyroscope.      

tBodyGyroJerkMag

Numeric, Magnitude of body jerk time domain signal from gyration and angular velocity.      

fBodyAcc-

Numeric, Body acceleration frequency domain signal from accelerometer.      

fBodyAccJerk-

Numeric, Body jerk frequency domain signal from accelerometer.      

fBodyGyro-

Numeric, Body gyration frequency domain signal from gyroscope.      

fBodyAccMag

Numeric, Magnitude of body acceleration frequency domain signal from accelerometer.

fBodyAccJerkMag

Numeric, Body jerk frequency domain signal from body acceleration and angular velocity.     

fBodyGyroMag

Numeric, Magnitude of body gyration frequency domain signal from gyroscope.     

fBodyGyroJerkMag

Numeric, Magnitude of body jerk frequency domain signal from gyration and angular velocity.


