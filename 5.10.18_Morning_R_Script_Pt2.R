#Data Structures
  #make a dataframe
cats<-data.frame(coat=c("calico","black","tabby"),
                 weight=c(2.1,5.0,3.2),
                 likes_string=c(1,0,1))
    #c is the combine function, 1,0,1 means binary, 1 is yes and 0 is no
    #put on different lines to make it look neater
write.csv(x=cats,file="data/feline_data.csv") #saves dataframe as .csv

cats #view dataframe
cats$weight #just view the weights
cats$coat
cats$weight+2 #add 2 to every value in this column in the dataframe

cats$weight+cats$coat #doesn't work because we are trying to perform an operation in vectors with different classes (numerical and factors)
class(cats$weight) #gives the class of the column, this one is numeric
class(cats$coat) #this one is a factor, factors have levels

str(cats) #gives structure of cats
  #columns in data frames are essentially vectors, we can treat them as such
str(cats$coat)

  #change order of factors
cats$coats_reorder<-factor(x=cats$coat,
                           levels=c("tabby","calico", "black"),
                           ordered=TRUE)
    #ordered is a logical argument
str(cats$coats_reorder)
levels(cats$coats_reorder)

#Exploring Data Frames

  #read in data
gap<-read.csv(file="data/gapminder-FiveYearData.csv")

head(gap) #shows top 6 rows of dataframe
str(gap)
nrow(gap) #number of rows
ncol(gap) #number of columns
dim(gap) #dimensions (rows, columns)
colnames(gap) #column names

#Subsetting Data
x<-c(5.4,6.2,7.1,4.8,7.5)
x
names(x)<-c("a","b","c","d","e") #needs to be the same length as your first vector, names the vector
`names<-`(x, c("a","b","c","d","e")) #needs to be the same length as your first vector, names the vector

  #use square brackets to look at certain pieces of data, tells R to get the nth element from the vector
x[1]
x[3]
x[c(1,3)] #make sure to use the combine function

  #slices
x[1:4]
x[c(1:2,4:5)]
x[-2] #gives output but removes second variable
x[-(2:4)]

#subsetting gapminder data
head(gap[1])
head(gap["pop"])
head(gap[,1]) #just subsetting by column
gap[3,] #just subsetting by row (row,column)
gap[138,5] #check 138th row, 5th column

albania<-gap[13:24,3:6]
albania

afghanistan<-gap[1:12,]
afghanistan$gdp<-(afghanistan$pop)*(afghanistan$gdpPercap)
write.csv(x=afghanistan, file="results/afghanistan_data.csv")
