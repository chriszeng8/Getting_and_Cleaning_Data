# Web scraping

# 1. ========= One way to read it as url, and then readLines ==========
con<-url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode<-readLines(con)
# just like working with database, we want to make sure we close th
close(con)
htmlCode # However, unformatted

# 2. ============== Structure way: Parsing with XML ===================
library(XML)
Read_url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
Read_html<-htmlTreeParse(Read_url,useInternalNodes=T)
xpathSApply(Read_html,"//title",xmlValue)

# 3. ================= GET function from httr pkg ======================
library(httr)
# GET url
Read_html2<-GET(Read_url)
# Read/extract html content as text
Content2<-content(Read_html2,as="text")
parsedHTML<-htmlParse(Content2,asText=TRUE)
xpathSApply(parsedHTML,"//title",xmlValue)


# For more, google R blogger - Web Scraping
# http://www.r-bloggers.com/search/web%20scraping