# =============== summarize() is the most powerful when applied to grouped data =======================
# The main idea behind grouping data is that you want to break up your dataset into groups of rows based 
# on the values of one or more variables. The group_by() function is reponsible for doing this.

library(dplyr)

cran<-tbl_df(mydf)
#X       date     time    size r_version r_arch      r_os      package version country ip_id
#1   1 2014-07-08 00:54:41   80589     3.1.0 x86_64   mingw32    htmltools   0.2.4      US     1
#2   2 2014-07-08 00:59:53  321767     3.1.0 x86_64   mingw32      tseries 0.10-32      US     2
#3   3 2014-07-08 00:47:13  748063     3.1.0 x86_64 linux-gnu        party  1.0-15      US     3
#4   4 2014-07-08 00:48:05  606104     3.1.0 x86_64 linux-gnu        Hmisc  3.14-4      US     3
#5   5 2014-07-08 00:46:50   79825     3.0.2 x86_64 linux-gnu       digest   0.6.4      CA     4
.. ..        ...      ...     ...       ...    ...       ...          ...     ...     ...   ...

# ==================================== G R O U P I N G =======================================
# ============================= 1. group_by() function =======================================
# Our first goal is to group the data by package name. Bring up the help file for group_by().
# group_by(tbl_df_var,grouping_var)
by_package<-group_by(cran,package)

# When we applied mean(size) to the original tbl_df via summarize(), it returned a single number -- the
# mean of all values in the size column.
summarize(cran,avg_bytes=mean(size))

# hat's exactly what you'll get if you use summarize() to apply mean(size) to the grouped data in by_package
summarize(by_package,avg_bytes=mean(size))
#package mean(size)
#1           A3   62194.96
#2  ABCExtremes   22904.33
#3     ABCoptim   17807.25
#..         ...        ...

# Instead of returning a single value, summarize() now returns the mean size for EACH package in our dataset

# Note that all these five defined variables: count, unique, countries, avg_bytes are single statistics 
# about the groups.
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))
## The 'count' column, created with n(), contains the total number of rows (i.e. downloads) for each package. 
## The 'unique' column, created with n_distinct(ip_id), gives the total number of unique downloads for each package, as
## measured by the number of distinct ip_id's. The 'countries' column, created with n_distinct(country), provides
## the number of countries in which each package was downloaded. And finally, the 'avg_bytes' column, created with
## mean(size), contains the mean download size (in bytes) for each package.

## ==================================== Quantile: Very useful stuff =======================================
## say We need to know the value of 'count' that splits the data into the top 1% and bottom 99% of packages 
## based on total downloads.  In statistics, this is called the 0.99, or 99%, sample quantile. 
quantile(pack_sum$count,probs=0.99)


## By default, if the dataset you'r working with has more than 100 rows, dplyr will only print the first 10.

##        package count unique countries   avg_bytes
##1       ggplot2  4602   1680        81 2427716.054
##2          Rcpp  3195   2044        84 2512100.355
##3          plyr  2908   1754        81  799122.790
##4         rJava  2773    963        70  633522.348
##5           DBI  2599    492        48  206933.250
##6          LPCM  2335     17        10  526814.226
##7       stringr  2267   1948        82   65277.166
##8        digest  2210   1894        83  120549.294
##9      reshape2  2032   1652        76  330128.263
##10      foreach  1984    485        53  358069.782

## =========================== C H A I N I N G / P I P I N G ================================
## ===================== logic steps of what happens in sequence ============================
## Chaining allows you to string together multiple function calls in a way that is compact and readable, while still
## accomplishing the desired result. To make it more concrete, let's compute our last popularity metric from
## scratch, starting with our original data.



## functions to the right of the chain &>% does not need to take the argument n the left again 
## as the first argument.
##
## 

