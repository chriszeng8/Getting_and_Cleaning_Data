# To install the R HDF5 package
# ==============================================================
#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")
# ==============================================================
library(rhdf5)

# ================== Create an HDF file ========================
# create an HDF 5 file
created=h5createFile("example.h5")
created

# =============== Create groups in an HDF file =================
created=h5createGroup("example.h5","foo") # create a group called foo
created=h5createGroup("example.h5","bar") # create a group called bar
created=h5createGroup("example.h5","foo/foobar") # create a sub-group within foo called foobar
h5ls("example.h5") # list all groups in "example.h5"

# =============== Write datasets to groups =====================
# ============ write matrix, array, data.frame =================
A=matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")  # write matrix A to a particular group foo/A in this case
B=array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale")<-"liter" # add an attribute, meta data which is the unit
h5write(B,"example.h5","foo/foobar/B")  # write array B to a particular group "foo/foobar/B"
h5ls("example.h5") # list all groups in "example.h5"

#=== we can also write a data set without pre-creating a group ==
# we create the data set at the direct top level
DF_A=data.frame(1L:5L,seq(0,1,length=5),c("ab","cde","fghi","a","s"),stringAsFactors=F)
h5write(A,"example.h5","DF_A")

# ====================== Read dataset ===========================
# h5read() specifies the h5 file name first, then the level/group
readA=h5read("example.h5","foo/A")
read_DF=h5read("example.h5","DF_A") #directly read dataset from top level group
readA
read_DF

# =============== Directly Read/Write dataset ==================
# Write the values c(12,13,14) to examples.h5's foo/A group's row 1:3, column 1 
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
# Similarly to read the same section
h5read("example.h5","foo/A",index=list(1:3,1))

