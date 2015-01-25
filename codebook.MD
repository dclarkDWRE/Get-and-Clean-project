
data was obtained:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
Note this analysis require the reshape package

Data was prepped using the following step:

load all required .txt files and label the datasets
load test data 
Load training data  
Load the ids of the test subjects and label the the dataframe's columns
Load the activity id's of the training data and label the dataframe columns
Combine test subject id's, the test activity id's and the test data
Combine test data and the train data into one dataframe and keep the columns refering to mean or standard dev values
Melt the dataset with descriptive activity sort the melted dataset according to the average of each variable

Export the final file

Create a file with the new tidy dataset called tidy_movement_data.txt