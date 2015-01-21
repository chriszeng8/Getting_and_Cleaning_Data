# Jan 20, 2015, C.Z.Zeng
# ==================== CUTTING UP QUANTITATIVE VARIABLES =========================
# Takeaways:
# 1. cut(vector,breaks=quantile(vector)) 
# 2. cut2(vector,g=n)
# 3. mutate() to create a new data frame with categorical data
# 4. Convert numeric to categorical data and set the base variable manually, by using 
#    vector_Fac<-factor(vector,levels=c("lvl2","lvl1"))
#    relevel(vector_Fac,ref="lvl2")


setwd("~/Github_Repo/Getting_and_Cleaning_Data/Summarizing_Data/")
restData<-read.csv("Restaurants.csv")

# ==================== METHOD 1: CUT() function ===================================
# Note that cut() function will return a factor variable
# it will categorize each record into a quantile (which is categorical data)
# Break it into 4 quantiles.
restData$zipGroups<-cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode) # 2D countif table

# Break it into 5 quantiles.
restData$zipGroups_by20<-cut(restData$zipCode,breaks=quantile(restData$zipCode,seq(0,1,length=5+1)))
table(restData$zipGroups_by20)
table(restData$zipGroups_by20,restData$zipCode) # 2D countif table

# ==================== METHOD 2: CUT2() function ==================================
# > install.packages("Hmisc")
library(Hmisc)
restData$zipGroups2<-cut2(restData$zipCode,g=4)
class(restData$zipGroups2)

# =================== CONVERSION TO FACTOR VARIABLES/LEVELS =======================
# ======== How to turn numeric into categorical data aka factor variables =========
restData$zip_Cat<-factor(restData$zipCode)
# or
# restData$zip_Cat<-as.factor(restData$zipCode)
# seems to do the trick also
class(restData$zip_Cat)
head(restData)

# ============================== MUTATE FUNCTION ==================================
library(Hmisc);library(plyr)
# we would like create a new data frame called restData2, which is based on the 
# the existing DF restData, with the addition of another categorical data
# column called zipGroup3, which is grouped by 4 quantile of the zipCode.
restData2<-mutate(restData,zipGroups3=cut2(zipCode,g=4))
table(restData2$zipGroups3)

# =================== Level of factor variables =======================
# ========== DF_factor<-factor(vector,level=c("lvl1","lvl2")) =========

yesno<-sample(c("y","n"),size=10,replace=T)
table(yesno) # you can find that "n" is the base variable since it is in front of "y" alphabetically
factor(yesno)
# yesno is not factor type by default
# therefore, we need to use either
# 1. factor function with specified levels
# 2. factor function

# Manually set "y" as the lowest value
yesnofac<-factor(yesno,levels=c("y","n"))
factor(yesnofac)
relevel(yesnofac,ref="y") # use relevel function to set the base variable
table(yesnofac)

as.numeric(yesno)
as.numeric(yesnofac)  # convert the factor back to the original model