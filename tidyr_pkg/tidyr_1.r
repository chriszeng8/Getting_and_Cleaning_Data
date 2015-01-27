## Tidy data is formatted in a standard way that facilitates exploration and analysis and works seemlessly with
## other tidy data tools. Specifically, tidy data satisfies three conditions:
## 
## 1) Each variable forms a column
## 
## 2) Each observation forms a row
## 
## 3) Each type of observational unit forms a table

## =========================== gather() function in R ===============================
## Gather takes multiple columns and collapses into key-value pairs, duplicating all
## other columns as needed. You use gather() when you notice that you have columns that
## are not variables.

# stack overflow
library(dplyr)
# From http://stackoverflow.com/questions/1181060
stocks <- data.frame(
     time = as.Date('2009-01-01') + 0:9,
     X = rnorm(10, 0, 1),
     Y = rnorm(10, 0, 2),
     Z = rnorm(10, 0, 4)
)
gather(stocks, stock, price, -time)
stocks %>% gather(stock, price, -time)

# Using the help file as a guide, call gather() with the following arguments (in order): students, sex, count,
# -grade. Note the minus sign before grade, which says we want to gather all columns EXCEPT grade.

# the second and third arguments are just the name for the columns, they can be named as anything.
gather(students,sex,count,-grade)
# we will take multiple (all variables unless specified to be EXCEPTED) columns and collapase
# them into key-value pairs.

# Alternatively, the four argument can be column range that are to be collapsed.



## play()
## gather(students,sex,count,-grade)
## which ever you except will become the left most column
## =========================== separate() function in R ===============================














## Opposite to what gather is doing? spread()
## spread and gather are complements
## =========================== spread() function in R ===============================
## gather and separate function normally go hand in hand.
## gather first, then separate is common.
## However, using CHAINING %>% can be used

stocks <- data.frame(
     time = as.Date('2009-01-01') + 0:9,
     X = rnorm(10, 0, 1),
     Y = rnorm(10, 0, 2),
     Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)
## read: spread the data across time (expand from single column to multiple columns according to time)
## spread(columns_var_name,y_values)

# Spread and gather are complements
df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)


# =============================== extract_numeric() function ========================================
# Lastly, we want the values in the class column to simply be 1, 2, ..., 5 and not class1, class2, ...,
# class5. We can use the extract_numeric() function from tidyr to accomplish this. To see how it works, 
# try extract_numeric("class5").



## ================================ rbind_list function =============================================
## This is an efficient version of the common pattern of do.call(rbind, dfs) for row-binding many data 
## frames together. It works in the same way as rbind.fill but is implemented in C++ so avoids many 
## copies and is much much faster.
rbind_list(passed,failed)

## The SAT is a popular college-readiness exam in the United States that consists of three sections:
## critical reading, mathematics, and writing. Students can earn up to 800 points on each section. This
## dataset presents the total number of students, for each combination of exam section and sex, within each
## of six score ranges. It comes from the 'Total Group Report 2013', which can be found here:
## 
## http://research.collegeboard.org/programs/sat/data/cb-seniors-2013

