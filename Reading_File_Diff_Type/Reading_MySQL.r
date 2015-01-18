# Jan 17th 2015 Chris Zeng
# install.packages("RMySQL")
library(RMySQL)

# dbConnect to connect to a database
# dbConnect can be used connect with type of databases other than MySQL
ucscDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")

# go ucsc database, and run SQL command: "show databases;")
# Note that "show databases;" are actually SQL command
result<-dbGetQuery(ucscDb,"show databases;")

# Disconnect that database
dbDisconnect(ucscDb)
# [1] TRUE  # which indicates the DB is disconnected

result # show all databases located at the specified host

# dbConnect command again, with further specification on the database name
hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
# list all tables within that database
allTables<-dbListTables(hg19)
length(allTables)
head(allTables)

# ============== Get 1. field and 2. records ======================
# Get the list of fields within that table
dbListFields(hg19,"affyU133Plus2")
# Get the number of records within a table
dbGetQuery(hg19,"select count(*) from affyU133Plus2")
# count(*)
# 1    58463

# ============= Read from data ====================================
affyData<-dbReadTable(hg19,"affyU133Plus2")
head(affyData)

# ================= Query (select a specific subset AND fetch a subset) ==============
# Select a subset
query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")

# fetching is when we store the query into local memory
# To fetch the whole table
# >affMis<-fetch(query)

# However, to fetch/suck out a subset table
affMis<-fetch(query,n=10)

# ================== CLEAR THE QUERY!!!!!!! ======================
dbClearResult(query)

# =============== Important  =====================================
# ==========FINALLY, CLOSE THE CONNECTION!! ======================
dbDisconnect(hg19)