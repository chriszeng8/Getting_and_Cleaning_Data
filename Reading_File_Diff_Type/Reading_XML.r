# Using an XML file from W3School.com as example
# First, we need to load the XML library


library(XML)
fileUrl<-"http://www.w3schools.com/xml/simple.xml"
# xmlTreeParse function generates an R structure representing the XML/HTML tree
doc<-xmlTreeParse(fileUrl,useInternalNodes = TRUE)
class(doc)
# [1] "XMLInternalDocument" "XMLAbstractDocument"

# ============================== NOTE !!!!!!!! ==============================
# To parse a http xml files, xmlTreeParse within the XML package is suitable!
# However, if the url is https (yes, with the S), we will need to use Rcurl
# package. The following are the sample code

#>library(RCurl)
#>fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#>xData <- getURL(fileURL)
#>doc <- xmlParse(xData)
#>rootNode<-xmlRoot(doc)


# Top level Wrapper XML node 
# (i.e., XML code within <breakfast_menu> ... </breakfast_menu>section)
rootNode<-xmlRoot(doc)



# Node name
xmlName(rootNode)

# Names of nested elements within that rootNode.
names(rootNode)

# Double square bracket [[]] for nested elements within the rootNode.
# 1st element 
rootNode[[1]]

# Keep drilling down to lower level (smaller element)
rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue)
# Extract all the "name" elements
# rootNode, Pass the entire document contained in the top level node
# //name: go through all the nodes corresponding to the "name" Xpath element
# xmlValue:

xpathSApply(rootNode,"//name",xmlValue)
# Extract all the "price" elements
xpathSApply(rootNode,"//price",xmlValue)

