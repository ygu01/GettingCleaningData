
#######read files in training and test folders as lists
subfold1 <- dir('UCI HAR Dataset/train')[-1]
subfold2 <- dir('UCI HAR Dataset/test')[-1]

train <- lapply(as.list(subfold1), function(x) read.table(paste0(getwd(),'/UCI HAR Dataset/train/',x)))
test <- lapply(as.list(subfold2), function(y) read.table(paste0(getwd(),'/UCI HAR Dataset/test/',y)))

###Merges the training and the test sets to create one data set.
data1<-rbind(train[[2]],test[[2]],all=TRUE)
subjects<-rbind(train[[1]],test[[1]],all=TRUE)
activity<-rbind(train[[3]],test[[3]],all=TRUE)

###Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table(paste0(getwd(),'/UCI HAR Dataset/features.txt'))[,2]

####Appropriately labels the data set with descriptive activity names.
features<-make.names(features)
features1<-sapply(features,function(x) gsub("\\.","",x))
colnames(data1)<-features1 
data2<-data1[grep("std|mean",features1,value=TRUE)]

####Uses descriptive activity names to name the activities in the data set

require(car)
activity1<-recode(activity[,1],'"1"="walking";"2"="walking_upstairs";"3"="walking_downstairs";"4"="sitting";
                  "5"="standing";"6"="laying"')
activity2<-data.frame(activity1)
colnames(activity2)<-"Activity"

####Add activity names. 
subjects1<-data.frame(subjects)
colnames(subjects1)<-"Subject"

one_data_set<-cbind(data2,subjects1,activity2)

#######Creates a second, independent tidy data set with the average of each variable for each 
########activity and each subject. 
avedata<-aggregate(one_data_set[,1:79], list(one_data_set$Subject,one_data_set$Activity), mean)
colnames(avedata)[1]<-"Subject"
colnames(avedata)[2]<-"Activity"
write.table(file="cleandata.txt",x=avedata)
