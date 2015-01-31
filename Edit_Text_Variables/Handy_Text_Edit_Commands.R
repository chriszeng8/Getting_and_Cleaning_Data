# Jan 30 2015
# Chris Z. Zeng
# Summary of useful function in editing text

Sentence<-"This _is_ a_ sentence_ with _no _meaning _whatsoever.()"

## ===================== 1. Lower or upper case ===============================
# ========== tolower and toupper function: lowercase and UPPERCASE ============
lowersentence<-tolower(Sentence); print (lowersentence)
UPPERSENTENCE<-toupper(Sentence); print (UPPERSENTENCE)


## ===================== 2. substitute substrings =============================
# ========= sub function: replace only the first substring ====================
# remove the first "_" found
Sentence1.1<-sub("_","",Sentence); print (Sentence1.1)
# remove only one substring (either _ or " " space). Whichever comes first will be replaced
Sentence1.2<-sub("_| ","",Sentence); print (Sentence1.2) 

# ========= gsub function: replace all the substring ==========================
Sentence2.1<-gsub("_","",Sentence) #remove all "_"
Sentence2.2<-gsub("_| ","",Sentence) #remove all "_" or " "

# ======= \\: to sub brackets and other special symbols, prefix with \\========
RemoveDot1<-gsub(".","",Sentence); print (RemoveDot1)
RemoveDot2<-gsub("\\.","",Sentence); print (RemoveDot2)

RemoveBracket1<-gsub("()","",Sentence); print (RemoveBracket1)
RemoveBracket2<-gsub("\\()","",Sentence); print (RemoveBracket2)

## ================== 3. split strings (delimiter) ============================
# ========= strsplit function: replace all the substring ======================
SplitString<-strsplit(Sentence,"_"); print(SplitString)
# Note that the split strings stored as a list
class(SplitString)

# Reminder: how to subset an element within an element of a list
SplitString[[1]][2]

# ============== what if the sentences are stored in a vector? ================
SentenceS<-c("this is funny", "but I don't find it funny", "really? what is wrong with you?")
SplitStringS<-strsplit(SentenceS," "); print(SplitStringS)

# what if we would like to take the second element of all sentences?
# First define a function
TakeSecondElement<-function(x){x[2]}
TakeSecondElement(SplitStringS[[1]]) # try out the function

# Take the second word of all three sentences.
sapply(SplitStringS,TakeSecondElement)



