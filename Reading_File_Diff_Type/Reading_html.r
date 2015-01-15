# Jan 10, 2015 Zeng
# Here we are reading and parsing a webpage (i.e., html), and
# extract the xmlValues of specificied elements/classes using
# ============================================================
# Interest<-xpathSApply(Parsed_doc,"//li[@class='']",xmlValue)
# ============================================================

fileUrl<-"http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"

# ========================  Important ========================
# "useInternalNodes = TRUE" will enable us to record all the 
# sub-node within the top level nodes
doc<-htmlTreeParse(fileUrl,useInternalNodes = TRUE)

# Extract xmlValues from the list class score
# <li class="score">
scores<-xpathSApply(doc,"//li[@class='score']",xmlValue)
teams<-xpathSApply(doc,"//li[@class='team-name']",xmlValue)
game_status<-xpathSApply(doc,"//li[@class='game-status']",xmlValue)

scores
teams
game_status
