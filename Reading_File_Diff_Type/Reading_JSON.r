# Convert between JSON data and R object
# Takeaways:
# fromJSON function--convert from JSON to an R object 
#          (both url or JSON object can be arguments)
# toJSON function--convert to JSON from an R object

# Example 1: convert from JSON to R object (fromJSON function)
library(jsonlite)
# fromJSON: reading in the JSON file, and construct a data frame
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")
# we can see that fromJSON converts the JSON file to an R object, which is dataframe
# in this case
class(jsonData)
names(jsonData)

jsonData$owner #Look at lower levels
jsonData$owner$login #Look at even lower levels
jsonData$owner$id
jsonData$owner$url


# Example 2: convert to JSON from an R object (toJSON function)
# iris is a built-in data frame in R.
myjson <- toJSON(iris, pretty=TRUE) # Pretty = TRUE gives nice notation and format.
cat(myjson)

# Note in the first example, we passed an url to the fromJSON function
# now, we can also pass a JSON object
iris2<-fromJSON(myjson)
head(iris2)

# Re-constructed/created iris2 appear identical to iris data frame now.