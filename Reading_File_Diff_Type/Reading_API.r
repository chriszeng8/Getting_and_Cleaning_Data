library(httr)
library(rjson)
library(jsonlite)
# Do not put your own password and key in a copy that is uploaded to Github
myapp<-oauth_app("twitter",
                key="your_own_key",
                secret="your_own_secret")
sig<-sign_oauth1.0(myapp,
                  token="your_own_token",
                  token_secret="your_own_token_secret")
# URL corresponds to Twitter's API.
# statues of my own home_timeline
homeTL=GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)
json1=content(homeTL) # return a structured R object, R will recognise it as JSON
json2=jsonlite::fromJSON(toJSON(json1)) #jsonlit to create a data frame 
# This is the most recent twit I received
json2[1,1:4]
