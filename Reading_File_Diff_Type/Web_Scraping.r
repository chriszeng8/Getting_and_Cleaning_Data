# http://www.r-bloggers.com/web-scraping-the-basics/
# 1. Paste function handy in web scraping

var=201401
url=paste("http://stats.grok.se/json/en/",var,"/web_scraping",sep="")
url
# Browse URL function opens an URL address

# fetching data 
browseURL(url)
raw.data <- readLines(url, warn="F") 
raw.data

library(jsonlite)
rd<-fromJSON(raw.data)

rd.views<-rd$daily_views
rd.views

# unlist() function produces a vector which simplifies it to produce
# a vector which contains all the atomic components which occur in x
rd.views <- unlist(rd.views)
df <- as.data.frame(rd.views)
df

# All of the steps above can be summarized as the following three lines
#============ STEP 1: PUT IT TOGEHTER ==================================
#rd <- fromJSON(readLines(url, warn="F"))
#rd.views <- rd$daily_views 
#df <- as.data.frame(unlist(rd.views))

#============== STEP 2: PLOTTING IT ====================================
require(ggplot2)
require(lubridate)
df$date <-  as.Date(rownames(df))
colnames(df) <- c("views","date")
ggplot(df,aes(date,views))+
     geom_line()+
     geom_smooth()+
     theme_bw(base_size=20)
