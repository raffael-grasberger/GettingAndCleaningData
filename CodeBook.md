# Process
First, all the relevant files were loaded (described in README.md).  
Then, the files were merged and the according activity labels and subjects were joined.  
Finally, the data was grouped by subject and activity and every column was averaged.  

# Variables
The tidyData dataframe contains the end result of the data cleaning process.  
- The first column is a factor indicating the activity.  
- The second column is an integer indicating the subject.  
- The following 86 columns are averages of all mean and standard deviation columns of the original datasets.