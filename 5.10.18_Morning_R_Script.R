53+23
53+
23

3+5*2
(3+5)*2

log(1) #natural logarithm
log10(10) #base-10 logarithm
exp(0.5) #exponent

#variable assignment
x<-1/40
x

log(x)

x<-100

x<-x+1
x

y<-x*2
y

#Naming
  #periods.between.words
  #underscores_between_words
  #camelCaseToSeparateWords

  #Can't:
    #Start with a number
    #Have spaces

#Vectorization
1:5 #numbers from 1 to 5

2^(1:5) #raise 2 to all the values in the vector

x<-1:4
y<-5:8

x+y #adds first values to each other, second values to each other, etc

#managing environment
ls()  #gives list of variables in local environment
      #without the parentheses, tells us how the function operates
rm(age) #remove variable

rm(list = ls()) #remove all variables from environment
ls()

#R packages
installed.packages()  #gives name, version of packages
  #can also click on packages tab in R studio
update.packages("packagename") #should update packages regularly
  #can also update using the button in R studio
install.packages("gapminder") #can install package, should do this way to help reproducability of your work
  #can also install packages using button in R studio

library(gapminder)  #make package available in current R session

install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

  #it's a convention to put the libraries at the top of your script
  #put a comment with each package so you remember why it's there

#getting help
help(ls)
?ls
?rm

#fuzzy search
??read.ta #outputs possible functions you are looking for

#vignettes
vignette()
vignette("hcl-colors") #opens a pdf on the function

#CRAN task views are helpful for looking up packages as well, figuring out which packages to downloads
#stackoverflow is a good website for asking questions
  #tag search using [r]
  #very strict rules about posting quseetions

?dput #outputs ASCII file that can be shared on stackoverflow
sessionInfo() #make sure to use camel case; this is something stackoverflow people want to know
