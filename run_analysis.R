# set wd to file path

setwd("C:/Users/ULTRABOOK U840/Desktop/R/UCI HAR Dataset")

# save files as lists for accessibility

myfiles<-list.files(recursive=TRUE,pattern="*.txt")
myinstructions<-myfiles[1:4]
myfiles<-myfiles[-c(1:4)]

# read files in multiple dataframes

myvars <- lapply(myfiles, read.table)
mylabels<-lapply(myinstructions[c(1,2)],read.table,header=FALSE)
for (i in 1:length(myvars)) assign(paste(basename(myfiles[i])),myvars[[i]])
for (i in 1:length(mylabels)) assign(paste(basename(myinstructions[i])),mylabels[[i]])

# combine test and train labels by subject and activity

activity<-rbind(y_train.txt,y_test.txt)
subject<- rbind(subject_train.txt,subject_test.txt)


# clean and assign activities to id

activity$V1<-as.factor(activity$V1)
levels(activity$V1)<-activity_labels.txt[,2]
names(activity)<-"Activity"
names(subject)<-"Subject"
combinedlabels<-cbind(activity,subject)

# combine main training and test set variables

combinedbody<- rbind(X_train.txt,X_test.txt)
names(combinedbody)<-features.txt[,2]

# combine in one big datset and index/extract mean and sd columns

bigdata<-cbind(combinedlabels,combinedbody)
index<-grep("-mean\\(\\)|-std\\(\\)", names(bigdata))
finaldata<-bigdata[,c(1,2,index)]
write.table(finaldata, "finaldata.txt")

# make a tidy dataset with averages

library(data.table)
dt<- data.table(finaldata)
tidydata<- dt[, lapply(.SD, mean), by=c("Activity","Subject")]
tidydata<- tidydata[order(tidydata$Subject),]

write.table(tidydata, "tidydata.txt")
