

##Summary of useful function in editing text

**Jan 30 2015, Chris Z. Zeng**

**Rule of thumbs about variable name**

* Names of variables should:

1. all lower case when possible
2. not duplicated
3.  not have UNDERSCORES or DOTS or WHITESPACES


```{r}
Sentence<-"This _is_ a_ sentence_ with _no _meaning _whatsoever.()"
```

###1. Lower or upper case
**```tolower``` and ```toupper``` function: lowercase and UPPERCASE**

```{r}
lowersentence<-tolower(Sentence); print (lowersentence)
UPPERSENTENCE<-toupper(Sentence); print (UPPERSENTENCE)
```

###2. Replace substrings
**```sub``` function: replace only the first substring**
```{r}
# remove the first "_" found
Sentence1.1<-sub("_","",Sentence); print (Sentence1.1)
# remove only one substring (either _ or " " space). Whichever comes first will be replaced
Sentence1.2<-sub("_| ","",Sentence); print (Sentence1.2) 
```

**```gsub``` function: replace all the substring**
```{r}
Sentence2.1<-gsub("_","",Sentence) #remove all "_"
Sentence2.2<-gsub("_| ","",Sentence) #remove all "_" or " "
```
**```\\```: to sub brackets and other special symbols, prefix with ```\\```**
```{r}
RemoveDot1<-gsub(".","",Sentence); print (RemoveDot1)
RemoveDot2<-gsub("\\.","",Sentence); print (RemoveDot2)

RemoveBracket1<-gsub("()","",Sentence); print (RemoveBracket1)
RemoveBracket2<-gsub("\\()","",Sentence); print (RemoveBracket2)
```

###3. Split strings into a list

**```strsplit``` function: split the string into a list of elements**
```{r}
SplitString<-strsplit(Sentence,"_"); print(SplitString)
# Note that the split strings stored as a list
class(SplitString)

# Reminder: how to subset an element within an element of a list
SplitString[[1]][2]
```

**what if the sentences are stored in a vector?**
```{r}
SentenceS<-c("this is funny", "but I don't find it funny", "really? what is wrong with you?")
SplitStringS<-strsplit(SentenceS," "); print(SplitStringS)
```
**what if we would like to take the second element of all sentences?**

First define a function which takes the second element of the object:
```{r}
TakeSecondElement<-function(x){x[2]}
TakeSecondElement(SplitStringS[[1]]) # try out the function
```

**Take the second word of all three sentences.**
```{r}
sapply(SplitStringS,TakeSecondElement)
```

###4. Find Values/Text
```{r}
String_Vect<-c("How are you?", "I am good", "We are good")
```

**```grep``` function: find indices of the instances contains values/substring.**

Find the indices of elements with string "are":
```{r}
grep("are",String_Vect)
```
Result:
```{r}
[1] 1 3
```

**```grepl``` function: return a logical vector of whether instances contains substring.**
```{r}
grepl("are",String_Vect)
```
Result:
```{r}
[1]  TRUE FALSE  TRUE
```
**Subset the data using grepl.**

Subset the elements with "are" using grepl:
```{r}
String_Vect[grepl("are",String_Vect)]
```

Alternatively, ```grep(,,value=TRUE)``` will return the same subset.
```{r}
grep("are",String_Vect,value=TRUE)
```
Result:
```{r}
[1] "How are you?" "We are good" 
```

Subset the elements without "are"
```{r}
String_Vect[!grepl("are",String_Vect)]
```


###5. More Useful String Fuctions
**From ```library(stringr)```**

**```nchar()``` function gives the number of character**
```{r}
nchar("Chris Zeng")
[1] 10
```
**```substr(string,start,end)``` take certain part of the string**

Take a substring from the 5th character to the 7th character.
```{r}
substr("123_BVA_232327A",5,7)
[1] "BVA"
```

**```paste(a,b)``` will paste two strings together, separated by space**
```{r}
paste("Chris","Zeng")
[1] "Chris Zeng"
```

**```paste0``` will paste two strings together WITHOUT space in the middle**
```{r}
paste0("Chris","Zeng")
[1] "ChrisZeng"
```

**```str_trim``` trim off excess white space at the end of a string**
```{r}
str_trim("Chris Zeng              ")
[1] "Chris Zeng"
```