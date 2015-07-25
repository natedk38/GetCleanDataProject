# GetCleanDataProject
Repo to store files related to the Getting and Cleaning Data course project
There are 3 files in thie repo associated with the Getting and Cleaning Data course project.

1. README.md:  a markdown file that lists and describes the files in the GetCleanDataProject repo and provides instructions on obtaining the desired tidy data set

2. run_analysis.R: an R script that accomplishes 5 tasks - 
    a. Downloads the required zipped data for this project, unzip the folder, and load the the separate data files into individual variables
    b. Extracts only the measurements on the mean and standard deviation for each measurement
    c. Merges the training and the test sets to create one data set, as well as matching the subject and activity to the training and test data
    d. Appropriately labels the data set with descriptive variable names
    e. Creates a second, independent tidy data set pf 180 observations of 68 variables, with the average of each variable for each activity and each subject, and writes this data set to a .txt file

3. codebook.md: a markdown file that:
    a. Describes the nature and methodology of the experiment
    b. Contains explanations of the measured data (variables)
    c. Contains explansations of the transformations performed on the data in the run_analysis.R file

Instructions to get and view the tidy data set:
  1. Install and load the 'plyr' and 'dplyr' packages.
  2. Source and run the run_analysis.R file in RStudio -> once the script is complete type the command >View(tidydataset)
 Or download the "Tidy Project Data Set.txt" file to your working directory and type the following commands:
  > tidydata<-read.table("Tidy Project Dat Set.txt", header=TRUE)
  > View(tidydata)
  
  
