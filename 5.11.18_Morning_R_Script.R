##Conditional Statements

number<-37
if (number>100){            #if condition is true
  print("greater than 100") #perform this function
}else{                      #if condition is false
  print("less than 100")    #perform alternative action
}
print("finished checking")

  #Comparison Operators:
    #greater than >
    #less than >
    #equal to == (double equals because one equals is an assignment operator)
    #not equal to !=
    #greater than or equal to >=
    #less than or equal to <=

number<-150
if (number>100){            #if condition is true
  print("greater than 100") #perform this function
}

  #More than 1 test in a conditional statement

number<--3
if (number>0){
  print(1)
}else if (number<0){
  print(-1)
}else{
  print(0)
}

  #Combine tests (can save a lot of code)

number1<--15
number2<--40

    #"and"
if(number1>=0&number2>=0){
  print("both numbers are positive")
}else{
  print("at least one is negative")
}
    #"or" (the | symbol)
if(number1>=0|number2>=0){
  print("at least one number is positive")
}else{
  print("at least one number is negative")
}

##Creating and Using Functions

  #creating a function
fahr_to_kelvin<-function(temp){
  kelvin<-((temp-32)*(5/9))+273.15
  return(kelvin)
}

  #running a function
fahr_to_kelvin(32)  #freezing point
fahr_to_kelvin(212) #boiling point


  #don't need to write "return," but good practice
kelvin_to_celcius<-function(temp){
  celcius<-temp-273.15
  celcius
}

kelvin_to_celcius(0)

  #variable scope
    #mix and match
fahr_to_celcius<-function(temp){
  temp_k<-fahr_to_kelvin(temp)
  temp_c<-kelvin_to_celcius(temp_k)
  return(temp_c)
}

fahr_to_celcius(32)

    #nesting functions
kelvin_to_celcius(fahr_to_kelvin(32))

  #practice
celcius_to_fahr<-function(temp){
  fahr<-(temp*(9/5)+32)
  return(fahr)
}

celcius_to_fahr(0)

##Making Reproducible Graphics

library(ggplot2)

  #read in some data
gap<-read.csv(file="data/gapminder-FiveYearData.csv")
head(gap)
str(gap)

plot(x=gap$gdpPercap,y=gap$lifeExp)

  #ggplot image
ggplot(data=gap,aes(x=gdpPercap,y=lifeExp))+  #aes means aesthetics; don't need to specify gap for every variable if start with data=
  geom_point()  #need to have this in order for points to be displayed

ggplot(data=gap,aes(x=year,y=lifeExp))+
  geom_point()

ggplot(data=gap,aes(x=year,y=lifeExp,by=country,
                    color=continent))+
  geom_line()+
  geom_point()  #if you want points on top of lines

ggplot(data=gap,aes(x=year,y=lifeExp,by=country))+
  geom_line(aes(color=continent))+  #different things being graphed can have different aesthetics
  geom_point(color="blue")

  #setting a scale (turn the x axis into a logarithmic scale)
ggplot(data=gap,aes(x=gdpPercap,y=lifeExp))+
  scale_x_log10()+
  geom_point(alpha=0.5)+  #change transparency of the points
  geom_smooth(method="lm",size=1)+  #gray shading is standard error from linear modeling; geom_smooth for trendline
  theme_bw()+ #changes gray background to white, black and white graph
  ggtitle("Effects of per-capita GDP on Life Expectancy")+   #adding axis labels and title
  xlab("GDP per capita($)")+
  ylab("Life Expectancy (yrs)")

  #saving files
ggsave(file="Results/life_expectancy.pdf")
?ggsave

  #faceting (makes compound figure)
ggplot(data=gap, aes(x=gdpPercap,y=lifeExp,color=continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")+
  facet_wrap(~year)
