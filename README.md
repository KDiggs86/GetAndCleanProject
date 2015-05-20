# GetAndCleanProject

##The run_analysis.R script cleans up the UCIHARdataset. 

###It works as follows.

After reading all of the data files into dataframes, we first merge the test data with the test activity codes. We do the same for the train data and train activity codes. In order to do this we need to rename the column of the activity codes so that there are no duplicate column names. We then merge the train and test dataframes to create one really big dataframe called data.


We then extract just the variables that are means or standard deviations from the data dataframe. From there we change the entries in the activity column (the very first column) so that they give a clear description of each activity. For example, an entry of 1 in the activity column meant that the volunteer was laying down. So, we changed all 1's in that column to "lay." We then changed all variable names to descriptive names. See the codebook for the translation of each variable name.


We now have a tidy dataframe called mean_sd_data. However, we want to create another dataframe in which each entry is the mean of each variable (column) for each activity. Hence, we used the ddply function to create the dataframe means_data. Finally, we transpose the means_data dataframe to create a long skinny table.

