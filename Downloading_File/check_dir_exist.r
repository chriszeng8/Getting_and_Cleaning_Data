#Setting the working directory
setwd("~/Desktop")
# Name the new sub-directory
dirName<-"data"

# Note that file.exists is the command to chek to see if the DIRECTORY exists
# There is no such function as dir.exists.
if (!file.exists(dirName)){
     dir.create(dirName) #dir.create to create the directory specified
}
