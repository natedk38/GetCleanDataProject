##run_analysis script to read in zipped data collected from the accelerometers from the Samsung 
##Galaxy S smartphone, combine the different data sets into a single data frame  via a common 
##element/variable, and shape to a form a tidy dataset as part of the Getting and Cleaning Data
##course project.  The output of this script is a tidy data set written to a text file called
## "Tidy Project Data Set.txt"
##IMPORTANT:  the 'plyr' and 'dplyr' packages must be loaded prior to running this script

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR
%20Dataset.zip"##define the URL where the data file is stored

temp<-tempfile() ##create a temporary file that will temporarily store the .zip from the web
download.file(url,temp)
unzip(temp,exdir=".") ##open the zip folder
setwd("~/UCI HAR Dataset") ##set the working directory to unzipped folder

## read in the measured variables and the activity labels
varnames<-read.table("features.txt",header=FALSE) 
activity<- read.table("activity_labels.txt",header=FALSE)

##change working directory to the 'train' folder and read in the train data and labels
setwd("~/UCI HAR Dataset/train")
traindata<-read.table("X_train.txt",header=FALSE)
trainlabel<-read.table("y_train.txt",header=FALSE)
subtrain<-read.table("subject_train.txt",header=FALSE)

##change working directory to the 'test' folder and read in the test data and labels
setwd("~/UCI HAR Dataset/test")
testdata<-read.table("x_test.txt",header=FALSE)
testlabel<-read.table("y_test.txt",header=FALSE)
subtest<-read.table("subject_test.txt",header=FALSE)

unlink(temp)

varnames$V1<-NULL ##remove the first column of the measured variables since they are index values 
##that are not of use for this exercise

varnames<-t(varnames)##transpose the variable names so each column is a name to assign to the 
##column names of the data
colnames(testdata)<-varnames
colnames(traindata)<-varnames

##remove unnecessary characters from the variable names from each set of
## data - 'train' and 'test'- and reassign the 'clean' names to the column 
## names of each data set
tempvar<-sub("\\()"," ",names(testdata))
colnames(testdata)<-tempvar
tempvar<-sub("-","",names(testdata))
colnames(testdata)<-tempvar

tempvar<-sub("\\()"," ",names(traindata))
colnames(traindata)<-tempvar
tempvar<-sub("-","",names(traindata))
colnames(traindata)<-tempvar

##section of code to gather only the mean and std variables, but leaves 
## out the angular(angle) data as well as the meanFreq (Frequency) data
varnames2<-colnames(traindata)
varnames3<-grep("angle",varnames2,invert=TRUE,value=TRUE)
meancols<-grep("mean",varnames3, ignore.case=TRUE,value=TRUE)
stdcols<-grep("std",varnames3, ignore.case=TRUE,value=TRUE)
meancols2<-grep("meanFreq",meancols,invert=TRUE,value=TRUE)

testmeandata<-testdata[,meancols2]
teststddata<-testdata[,stdcols]
trainmeandata<-traindata[,meancols2]
trainstddata<-traindata[,stdcols]

##combine the 'mean' and 'std' columns together
alltest<-cbind(testmeandata,teststddata)
alltrain<-cbind(trainmeandata,trainstddata)

##add the subject data and name the new column 'subject'
alltest<-cbind(subtest,alltest)
alltrain<-cbind(subtrain,alltrain)
colnames(alltest)[1]<-"subject"
colnames(alltrain)[1]<-"subject"

alltest<-cbind(testlabel,alltest)##add the labels column to the 'test' data
alltrain<-cbind(trainlabel,alltrain)##add the labels column to the 'train' data


alldata<-rbind(alltest,alltrain)##combines the desired subsets of the 'test' 
                                ##and 'train' data sets
Ti

alldata2<-merge(activity,alldata,by="V1")##matches the activity (walking,laying,etc..)
##to the data labels and merges the activity data to the larger data set
colnames(alldata2)[2]<-"activity"
alldata2$V1<-NULL##removes the data labels column as this is redundant now that
                 ## we have the 'activity' for each row

##for the tidy data set
tidymeanstd<-group_by(alldata2,subject,activity)##rearrange the data to be grouped
## by subject and then activity
tidydataset<-summarise_each(tidymeanstd,funs(mean),-subject,-activity)##calculates 
##the mean (average) of the 'mean' and 'std' data columns

write.table(tidydataset, file="Tidy Project Data Set.txt",row.name=FALSE)##write the tidy data
## to a text file
