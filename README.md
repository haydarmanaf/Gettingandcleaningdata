Gettingandcleaningdata
======================

## Project
* Download files and unzip
  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Save run_analysis.R to  C:~\UCI HAR Dataset\

* You MUST intialize "C:~\UCI HAR Dataset\" as your working directory prior to running

* After the file path has been set:
  
  source("run_analysis.R")

* Run script, which will load all files in the folder and will save two datasets:
  
  finaldata.txt(a summarized version by mean and SD parameters)

  tidydata.txt(average score by Subject and Activity)
