# use R 4.2.2  version is preferred

rm(list=ls())#remove all variables stored previously

library(Hmisc)

# covid19_line_list_data.csv data available location
data <- read.csv("C:/Users/prath/OneDrive/Desktop/Rstudio/COVID19_line_list_data.csv")

#describe is hmisc command and this is to understand the data
describe(data)

#death rate of dataset
data$death_dummy<-as.integer(data$death!=0)
sum(data$death_dummy)/nrow(data)


#age 
#first we will subset our dataset into patients who are alive and patients who are dead
dead=subset(data,death_dummy==1)
alive=subset(data,death_dummy==0)
#comparing the means of ages
mean(dead$age,na.rm=TRUE)
mean(alive$age,na.rm=TRUE)
#statistically significant
# with 95% of confidence level 
#the age difference between patients who have died and who haven't died  
t.test(dead$age,alive$age,alternative = "two.sided",conf.level=0.95)
#if p_value<0.005 we reject the null hypothesis 
#here p_value is 0 so we reject the null hypothesis so this is statistically significant 


#gender
men=subset(data,gender=="male")
women=subset(data,gender=="female")
#comparing means of death rates of male and female
mean(men$death_dummy,na.rm=TRUE)
mean(women$death_dummy,na.rm=TRUE)
##statistically significant
# with 95% of confidence level 
t.test(men$death_dummy,women$death_dummy,alternative = "two.sided",conf.level = 0.95)
#if p_value<0.005 we reject the null hypothesis 
#here p_value is 0.002 so we reject the null hypothesis so this is statistically significant
