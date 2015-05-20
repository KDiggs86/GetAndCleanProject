#First load the plyr package
library(dplyr)
#We begin by cleaning up the testdata a bit
testyRaw <- read.table("./UCIHARDataset/test/y_test.txt")
testxRaw <- read.table("./UCIHARDataset/test/x_test.txt")
#I want to merge testyRaw and testxRaw
#But first I need to rename the column in testyRaw from V1 to V0
testyRaw <- rename(testyRaw, V0=V1)
#I also want to create a column that keeps track of the fact that this data
#is from the test data. I think the way I did this is clunky, but it worked.
Group <- rep("test",2947)
Group <- data.frame(Group)
#In my merged dataframe I wanted the first col to be the labels and the second
#to be "test". So, I used a transitive-like idea of cbind:
testdata <- cbind(Group,testxRaw)
testdata <- cbind(testyRaw,testdata)
#Now repeat this process with the train data
trainyRaw <- read.table("./UCIHARDataset/train/y_train.txt")
trainxRaw <- read.table("./UCIHARDataset/train/x_train.txt")
trainyRaw <- rename(trainyRaw, V0=V1)
Group <- rep("train",7352)
Group <- data.frame(Group)
traindata <- cbind(Group,trainxRaw)
traindata <- cbind(trainyRaw,traindata)
#Time to merge testdata with traindata!
data <- rbind(testdata,traindata)
#Extracting just mean and SD data
#first create a vector the columns you want
cols <- c(1,2,3:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,
          255,256,268:273,296:298,347:352,375:377,426:431,454:456,505,506,515,
          518,519,528,531,532,541,544,545,554)
mean_sd_data <- data[,cols]
#Renaming activities
#First change values in V0 to characters (are currently integers)
mean_sd_data$V0 <- as.character(mean_sd_data$V0)
#Use gsub to replace each number with their corresponding activity
mean_sd_data$V0 <- gsub("1","walk",mean_sd_data$V0)
mean_sd_data$V0 <- gsub("2","walk upstairs",mean_sd_data$V0)
mean_sd_data$V0 <- gsub("3","walk downstairs",mean_sd_data$V0)
mean_sd_data$V0 <- gsub("4","sit",mean_sd_data$V0)
mean_sd_data$V0 <- gsub("5","stand",mean_sd_data$V0)
mean_sd_data$V0 <- gsub("6","lay",mean_sd_data$V0)
#Rename V0 to Activity for clarity
mean_sd_data <- rename(mean_sd_data,Activity=V0)
#Creating Descriptive Variable names. Surely there is a better way to do this?
mean_sd_data <- rename(mean_sd_data, m_tBAX=V1, m_tBAY=V2, m_tBAZ=V3,s_tBAX=V4,s_tBAY=V5,s_tBAZ=V6)
mean_sd_data <- rename(mean_sd_data, m_tGrAX=V41, m_tGrAY=V42, m_tGrAZ=V43,
                       s_tGrAX=V44,s_tGrAY=V45,s_tGrAZ=V46)
mean_sd_data <- rename(mean_sd_data, m_tBAJX=V81, m_tBAJY=V82, m_tBAJZ=V83,
                       s_tBAJX=V84,s_tBAJY=V85,s_tBAJZ=V86)
mean_sd_data <- rename(mean_sd_data, m_tBGyX=V121, m_tBGyY=V122, m_tBGyZ=V123,
                       s_tBGyX=V124,s_tBGyY=V125,s_tBGyZ=V126)
mean_sd_data <- rename(mean_sd_data, m_tBGyJX=V161, m_tBGyJY=V162, m_tBGyJZ=V163,
                       s_tBGyJX=V164,s_tBGyJY=V165,s_tBGyJZ=V166)
mean_sd_data <- rename(mean_sd_data, m_tBAM=V201, s_tBSM=V202, m_tGrAM=V214,
                       s_tGrAM=V215,m_tBAJM=V227,s_tBAJM=V228, m_tBGyM=V240, s_tBGyM=V241,
                       m_tBGyJM=V253, s_tBGyJM=V254)
mean_sd_data <- rename(mean_sd_data, m_fBAX=V266,m_fBAY=V267,m_fBAZ=V268,
                       s_fBAX=V269,s_fBAY=V270,s_fBAZ=V271,mfreq_fBAX=V294,
                       mfreq_fBAY=V295,mfreq_fBAZ=V296)
mean_sd_data <- rename(mean_sd_data, m_fBAJX=V345,m_fBAJY=V346,m_fBAJZ=V347,
                       s_fBAJX=V348,s_fBAJY=V349,s_fBAJZ=V350,mfreq_fBAJX=V373,
                       mfreq_fBAJY=V374,mfreq_fBAJZ=V375)
mean_sd_data <- rename(mean_sd_data, m_fBGyX=V424,m_fBGyY=V425,m_fBGyZ=V426,
                       s_fBGyX=V427,s_fBGyY=V428,s_fBGyZ=V429,m_fBAM=V503,
                       s_fBAM=V504,mfreq_fBAM=V513,m_fBAJM=V516,s_fBAJM=V517,
                       mfreq_fBAJM=V526)
mean_sd_data <- rename(mean_sd_data, mfreq_fBGyX=V452, mfreq_fBGyY=V453, mfreq_fBGyZ=V454)
mean_sd_data <- rename(mean_sd_data, m_fBGyM=V529, s_fBGyM=V530, mfreq_fBGyM=V539,
                       m_fBGyJM=V542, s_fBGyJM=V543, mfreq_fBGyJM=V552)
#Now that our data is super tidy we want to take the mean of each variable 
#for each activity
#First let's get rid of the Group column. I shouldn't have added it. Alas.
mean_sd_data <- mean_sd_data[-c(2)]

#Use ddply to take the mean of each variable for each activity
means_data <- ddply(mean_sd_data,.(Activity),colwise(mean))
#I think it is easier to read if the Activities become the columns and
#The variables become the rows. I prefer long and skinny data frames as opposed to
#short and wide ones. So, let's take the transpose.
means_data_t <- as.data.frame(t(means_data))