
## reshape2 package
library(reshape2)

## load all required .txt files and label the datasets
activity_labels <- read.table("activity_labels.txt",col.names=c("activity_id","activity_name"))

## load dataframe's column names

features <- read.table("features.txt")
feature_names <- features[,2]

## Load test data 
testdata <- read.table("X_test.txt")

##Label Columns from features.txt
colnames(testdata) <- feature_names

## Load training data  

traindata <- read.table("X_train.txt")

## label the dataframe's columns

colnames(traindata) <- feature_names

## Load the ids of the test subjects and label the the dataframe's columns

test_subject_id <- read.table("subject_test.txt")
colnames(test_subject_id) <- "subject_id"

## Load the activity id's of the test data and label the the dataframe's columns

test_activity_id <- read.table("y_test.txt")
colnames(test_activity_id) <- "activity_id"

## Load the ids of the test subjects and label the the dataframe's columns

train_subject_id <- read.table("subject_train.txt")
colnames(train_subject_id) <- "subject_id"

## Load the activity id's of the training data and label
##the dataframe's columns

train_activity_id <- read.table("y_train.txt")
colnames(train_activity_id) <- "activity_id"


##Combine test subject id's, the test activity id's
##and the test data into one dataframe

test_data <- cbind(test_subject_id , test_activity_id , testdata)

##Combine test subject id's, the test activity id's
##and the test data into one dataframe

train_data <- cbind(train_subject_id , train_activity_id , traindata)

##Combine test data and the train data into one dataframe

all_data <- rbind(train_data,test_data)

##Keep columns refering to mean() or std() values

mean_col_idx <- grep("mean",names(all_data),ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_idx]
std_col_idx <- grep("std",names(all_data),ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_idx]
meanstddata <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]

##Merge the activities data with the mean/std values datase


descrnames <- merge(activity_labels,meanstddata,by.x="activity_id",by.y="activity_id",all=TRUE)

##Melt the dataset with descriptive activity
data_melt <- melt(descrnames,id=c("activity_id","activity_name","subject_id"))

##Cast the melted dataset according to the average of each variable
mean_data <- dcast(data_melt,activity_id + activity_name + subject_id ~ variable,mean)

## Create a file with the new tidy dataset
write.table(mean_data,"./tidy_movement_data.txt")
}