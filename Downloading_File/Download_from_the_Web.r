# Create a directory
setwd("~/Desktop")
dirName<-"data"
if (!file.exists(dirName)){dir.create(dirName)}

# Download the file
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
# mac: method needs to be set as curl, for https
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")

list.files("./data")
#Good habit to record the date???
dateDownloaded<-date()