# Introduction

Program run_analysis.R creates clean dataset ('tidy_dataset.csv') with the mean for each variable every subject. This CodeBook provides a description of job that was done for cleaning the dataset.


# Transformations

To produce clean dataset 'tidy_dataset.csv' following manipulations were performed within 'run_analysis.R' program.
- Get the raw data, assign descriptive labels;
- Unite test and train data together;
- For each testing pull out only mean and standard deviation measurement;
- Use activities performed as the activity labels in dataset;
- Create independent tidy dataset with means for each variable-activity-subject.


# Variable description

Dataset contains 180 observations and 68 variables.
Group.1 - unique within Group.2 ID; has values 1 to 30 which represents subject, voluntarily providing vital signs data.
Group.2 - Describes how the position how the measurement was done. There are 6 conditions for the measurement: walking, walking upstairs, walking downstairs, sitting, standing and laying.
Then we have 17 parameters being analyzed. It was captured 3-axial linear acceleration and 3-axial angular velocity. Our dataset summarizes them by displaying mean and standard deviation. All variables are split into Time and Frequency measurement. In addition half of each subgroup measures triaxial acceleration from the accelerometer and the other - estimated body acceleration. Below parameters have been measured for each axis (X, Y and Z) vs time and frequency:
BodyAcc
GravityAcc
BodyAccJerk
BodyGyro
BodyGyroJerk

Below represents total acceleration magnitude measured vs time and frequency:
BodyAccMag
GravityAccMag
BodyAccJerkMag
BodyGyroMag
BodyGyroJerkMag
