# Jan 22, 2015
# exercise from Jeff Leek's Getting and Cleaning data Coursera Course
# commented by C.Z.Zeng
# ============================= Takeaways ==============================
# 1. intersect() function to find common elements

# 2. merge(DF1,DF2,by.x="id_in_DF1",by.y="id_in_DF2) function
#    to linked tables that have a common but differently named id.

# 3. join(a,b) function for joining two data frames with a common id.

# 4. join_all(list(a,b,c)) function for joining multiple data frames
#    with a common id.
# ============================= Takeaways ==============================

# Read 2 diff data frames with certain shared parameters
if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews = read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews)
head(solutions)
names(reviews)
names(solutions)
# common element
intersect(names(reviews),names(solutions))
#[1] "id"        "start"     "stop"      "time_left"

# Which two data sets would you like to merge?
# Solution id
# 1. merge which data frames? reviews and solutions in this case
# 2. by.x. specification of the columns used for merging.


# Three different scenarios:
# ====== 1. first scenario =======
# by.x and by.y are only used when the linked id have different 
# names, for example, the id column in review data frame, is the 
# same as the solution_id column in the solution data frame.
# To link these two ids. we specify the by.x="solution_id",by.y="id"
# all=TRUE, if there are empty data entries, show NAs.
mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
mergedData[order(mergedData$id),]

# ====== 2. second scenario =======
# if the column names exist in both data frames.
mergedData = merge(reviews,solutions,by="id",all=TRUE)
mergedData[order(mergedData$id),]

# ====== 3. third scenario =======
# if not specifying any id to the "by" argument
intersect(names(reviews),names(solutions))
mergedData = merge(reviews,solutions,all=TRUE)
head(mergedData)
# what happens is that start and stop can be different for the same if
# in two different data frames.

# With common id, which is like scenario 2 and 3 above, we can 
# easily complete the task using join() function from plyr package
library(plyr)
# ============ Use join function to merge two tables ================
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
# join by id
join(df1,df2)

# ======== Use join_all function to merge multiple tables ===========

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = list(df1,df2,df3)
join_all(dfList)