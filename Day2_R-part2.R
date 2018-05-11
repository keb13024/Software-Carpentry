##### Data Manipulation #####

# Make sure packages are installed
install.packages(c("tidyr", "dplyr", "knitr", "rmarkdown", "formatR"))

library(dplyr) # Needed for subsetting data
library(tidyr) # Needed for reshaping data
library(ggplot2) # Needed for graphing

# Read in our dataset
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")

##dplyr -- data wrangling

head(gap)

yr_country_gdp<-select(.data=gap,year,country,gdpPercap)  #subset the dataset with the "select" command, subset by columns
head(yr_country_gdp)

yr_country_gdp<-gap%>%select(year,country,gdpPercap)  #%>% sends the data to the select function, pipe function; works the same as the first example
head(yr_country_gdp)

  #subset by rows using filter
yr_country_gdp_eu<-gap%>%
  select(year,country,gdpPercap)%>%
  filter(continent=="Europe")
      #doesn't work because ORDER MATTERS!!
yr_country_gdp_eu<-gap%>%
  filter(continent=="Europe")%>%
  select(year,country,gdpPercap)
head(yr_country_gdp_eu)

  #you can subset by nesting; the filtered dataset acts as the dataset for the "select" function
yr_country_gdp_eu<-select(filter(gap,continent=="Europe"),year,country,gdpPercap)
head(yr_country_gdp_eu)
    #piping is more readable, easier to understand

  #practice
yr_country_lifeExp_africa<-gap%>%
  filter(continent=="Africa",year==2007)%>%
  filter(year==2007)%>%  select(year,country,lifeExp)
nrow(yr_country_lifeExp_africa)

  #summarize data
mean_gdp<-gap%>%
  summarize(meanGDP=mean(gdpPercap))
mean_gdp
mean(gap$gdpPercap) #does the same thing

    #summarize is helpful when using group_by
gdp_by_cont<-gap%>%
  group_by(continent)%>%
  summarize(meanGDP=mean(gdpPercap))
gdp_by_cont

gdp_by_cont<-gap%>%
  group_by(continent,year)%>%
  summarize(meanGDP=mean(gdpPercap),
            sd_gdp=sd(gdpPercap),
            mean_pop=mean(pop),
            sample_size=n()
            )
gdp_by_cont

  #dplyr has its own way of representing dataframes, but sometimes, you need to change it back into a datafram
    #gets rid of extra stuff at the top
gdp_by_cont%>%
  data.frame()%>%
  head()

gdp_by_cont%>%
  ggplot(aes(x=mean_pop,y=meanGDP))+
    geom_point()

  #mutate
bill_gdp<-gap%>%
  filter(year==2007)%>%
  mutate(billGDP=gdpPercap*pop/10^9)
head(bill_gdp)
    #mutate doesn't do any summarizing down: no "group by", just adds another column to the end

  #converting between wide and long datasets
gap_wide<-read.csv(file="data/gapminder_wide.csv")
  #more columns, fewer rows
str(gap_wide)

  #start to turn some rows into columns
gap_long<-gap_wide%>%
  gather(obstype_year,obs_values,starts_with("pop"),
         starts_with("lifeExp"),starts_with("gdpPercap"))
str(gap_long)
head(gap_long)

  #split one column into two columns
gap_long<-gap_long%>%
  separate(obstype_year,into=c("obs_type","year"),
           sep="_")
head(gap_long)

wide<-gap_long%>%
  unite(var_names,obs_type,year,sep="_")%>%  #undo the separate
  spread(var_names,obs_values)             #fewer rows, many columns
head(wide)
