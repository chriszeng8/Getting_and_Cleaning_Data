## Jan 25, 2015 C.Z.Zeng
## Source: from swirl: Getting and Cleaning data
## Takeaways:
## 1. SELECT   for subsetting columns
## 2. FILTER   for subsetting rows
## 3. ARRANGE  for sorting rows
## 4. MUTATE   for creating new columns based on existing columns
## 5. SUMMARIZE for collapsing rows and MORE

## One unique aspect of dplyr is that the same set of tools allow you to work with tabular data from a variety of sources, including data frames, data
## tables, databases and multidimensional arrays.

## How not to read string as factor? stringAsFactor=FALSE
## ============= read.csv("a.csv",stringAsFactor=FALSE) ==============
path2csv<-"/Library/Frameworks/R.framework/Versions/3.1/Resources/library/swirl/Courses/Getting_and_Cleaning_Data/Manipulating_Data_with_dplyr/2014-07-08.csv"
mydf<-read.csv(path2csv,stringsAsFactors=FALSE)

## ============ check which version of the package it is =============
packageVersion("dplyr")

## ================== tbl_df: data frame table =======================
## =================== or: Tabular data frame ========================
# tbl_df: can be converted from data.frame, data.tables, databases and arrays.
x_tbl<-tbl_df(mydf)
# data frame tbl type
class(x_tbl)
# [1] "tbl_df"     "tbl"        "data.frame"

## From ?tbl_df, "The main advantage to using a tbl_df over a regular data frame is the printing." Let's see what is
## meant by this. Type x to print our tbl_df to the console.
x_tbl
## This output is much more informative and compact than what we would get if we printed the original data frame
## (mydf) to the console.
## First, we are shown the class and dimensions of the dataset. Just below that, we get a preview of the data.
## Instead of attempting to print the entire dataset, dplyr just shows us the first 10 rows of data and only as many
## columns as fit neatly in our console. 

## The dplyr philosophy is to have small functions that each do one thing well.
## Specifically, dplyr supplies five 'verbs' that cover all fundamental data manipulation tasks:
## select(), filter(), arrange(), mutate(), and summarize().



############################  SELECT (for subsetting columns)  #################################
## ============== 1. How to select multiple variables (columns) from a data set ================
## select (data_fram_tbl_name,var1,var2,var3)
select(x_tbl, ip_id, package, country)

## ============== 2. Sequence like operation applied in select() function ======================
## from column r_arch to column country.
select(x_tbl, r_arch:country)
## we can also select the same columns in reverse order.
select(x_tbl, country:r_arch)

# Instead of specifying the columns we want to keep, we can also specify the columns we want to throw away. 
select(x_tbl, -time)
# throw away a sequence
select(x_tbl,-(X:size))

###############################  FILTER (for subsetting rows)  ##################################
## filtering for subsetting rows
## find records with package variable equals to swirl
filter(cran, package == "swirl")

## ============== 1. AND CONDITIONS ===============
## specify multiple subsetting criteria
filter(cran, r_version == "3.1.1", country == "US")
## Edit your previous call to filter() to instead return rows corresponding to users in "IN" (India) running an R
## version that is less than or equal to "3.0.2". The up arrow on your keyboard may come in handy here. Don't forget
## your double quotes!
filter(cran, r_version <= "3.0.2", country == "IN")

## ==============  2. OR CONDITIONS  ==============
## the comma `,` separates two AND conditions
## to use OR condition to filter, we use `|` to separate two conditions
filter(cran, country == "IN"|country == "US")


## ================= 3. FILTER NAs ================
## Use filter() to return all rows of cran for which r_version is NOT NA.
filter(cran,!is.na(r_version))

################################  ARRANGE (for ordering)  #####################################
## Now, to order the ROWS of cran2 so that ip_id is in ascending order (from small to large), 
## type arrange(cran2, ip_id). You may want to make your console wide enough so that you can 
## see ip_id, which is the last column.
cran2<-select(cran,size:ip_id)
arrange(cran2,ip_id)
arrange(cran2,desc(ip_id))

## =========== Two level sorting ============
## arrange the data according to the values of multiple variables. For example, arrange(cran2, package, ip_id)
## will first arrange by package names (ascending alphabetically), then by ip_id.This means that IF there are
## multiple rows with the same value for package, they will be sorted by ip_id (ascending numerically).
arrange(cran2, package, ip_id)
## you can even mix up the ascending and descending orders.
arrange(cran2, country, desc(r_version),ip_id)


###########################  MUTATE (for creating new columns/variables)  ##############################
############### will not assign the new column to the original tbl until you <- to an object. ##########
## We want to add a column called size_mb that contains the download size in megabytes. Here's the code to do it:
mutate(cran3, size_mb = size / 2^20)

## You can create a second additional column based on the first additional column specified
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)

######################  SUMMARIZE (for collapsing the dataset to a single row)  ########################

## Let's say we're interested in knowing the average download size. summarize(cran, avg_bytes = mean(size))
## will yield the mean value of the size variable. Here we've chosen to label the result 'avg_bytes', but
## we could have named it anything.

summarize(cran,avg_bytes=mean(size))
## Source: local data frame [1 x 1]
## avg_bytes
## 1  844086.5

## ========================= MOST USEFUL: APPLIED TO CATEGORICAL VARIABLES ==============================
## summarize() is most useful when working with data that has been grouped by the values of a particular variable.
## More on this, please see dplyr_2.r.