# The way to create a data table is the same as creating a data frame.
# 1. we need to load the data.table package
library(data.table)
set.seed(1)
DF=data.frame(x=rnorm(9),y=rep((1:3),each=3))
set.seed(1)
DT=data.table(x=rnorm(9),y=rep((1:3),each=3))
DT2=data.table(x=rnorm(8),y=rep((1:2),each=4))

# tables will return info of all the data tables 
# (which is why it is called table"S"!)
tables(DT)

# Comparisons between data frame and data table

# 1. Subset rows (similar, but note the DIFFERENCE in the row index)
# subset the second row
DF[2,]
DT[2,]
# 2. subset the data by looking at particular y value (difference in row index)
DF[DF$y==2,]
DT[DT$y==2,]

# ================== DIFFERENCE ======================================
DF[c(2,3)]  ##ERROR: Data Frame does not accept single argument
DT[c(2,3)]  ## Single argument in DT will be taken as row (2nd and 3rd row in this case)

# ================== SUBSET COLUMNS ==================================
DT[,c(2,3)]
# You must be like "what the heck?"
# It 


#Rather than passing the index, we can pass some of the function of that can be applied
#the named columns to the 2nd argument
DT[,list(mean(x),sum(y))]
# we can add additional criteria on variables by specifying the first variables,
# then specify the operations/functions in the second argument.
DT[DF$y==2,list(mean(x),sum(y))]

# return a table of the y values
DT[,table(y)]
# y
# 1 2 3     first row is the categories of y
# 3 3 3     quantity of each category

# ======== ADDING COLUMNS (EFFICIENT) ===================================
# another thing that data.table does efficiently is to add new columns
# Format: DT[,New_Col_Name:= ...] where ... is some kind of operation 
# using exisiting column variables
DT[,z:=y^2]
# ======== MEMORY EFFICIENT =============================================
# Profound difference: when dealing with data frame, adding a column
# to an exisiting data frame, will cause R to store two copies into 
# memory (RAM), whereas, data table does not have such problem. Data
# table only store the updated version of the table.

# ======== HAVE TO BE CAREFUL!!!!!!======================================
# If two data tables are linked (one is assigned to another)
DT2<-DT
DT2
DT[,w:=x*2]
# DT2 will be updated as well.
DT2
