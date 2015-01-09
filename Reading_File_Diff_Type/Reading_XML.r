# First, we need to load the XML library
library(XML)

fileUrl<-"http://www.w3schools.com/xml/simple.xml"

# xmlTreeParse function generates an R structure representing the XML/HTML tree
doc<-xmlTreeParse(fileUrl,useInternalNodes = TRUE)
class(doc)
# [1] "XMLInternalDocument" "XMLAbstractDocument"

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
