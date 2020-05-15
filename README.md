# GettingAndCleaningDataWeek4
Repository containing the code for the Coursera R course "Getting and Cleaning Data"

The run_analysis.R script combines the different files of the train and test set so that a single dataset is created. To this dataset, we add the subject observations and the activity they were performing.

The activity identities are remapped to meaningful variable names and only those columns of the original dataset are used that are related to the mean and std of the sensor readings.

The tidy dataset in the end is aggregated on the subject and the activity performing, where the observations correpsond to the mean.
