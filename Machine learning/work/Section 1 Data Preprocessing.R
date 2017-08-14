#Data Preprocessing

#Importing the data sets

getwd()
setwd("C:\\Users\\HP\\Desktop\\Machine learning")
dataset=read.csv('Data Part 1.csv')


?mean()

#filling missing values by mean

dataset$Age = ifelse(is.na(dataset$Age),ave(dataset$Age,FUN=function(x) mean(x,na.rm=TRUE)),
                     dataset$Age)
dataset

dataset$Salary = ifelse(is.na(dataset$Salary),ave(dataset$Salary,FUN=function(x) mean(x,na.rm=TRUE)),
                        dataset$Salary)

dataset


#Encoding categorical data

dataset$Country=factor(dataset$Country,levels=c('France','Spain','Germany'),labels=c(1,2,3))

dataset$Purchased=factor(dataset$Purchased,levels=c('No','Yes'),labels=c(0,1))

dataset
#Splitting data sets into test sets and training sets


#install.packages('caTools')
library(caTools)

set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



#Feature scaling


#training_set=scale(training_set)      #this wont work ...will show "is not numeric" since factor variables 
#test_set=scale(test_set)              #are not numeric therefore we specify the columns

training_set[,2:3]=scale(training_set[,2:3]) 
test_set[,2:3]=scale(test_set[,2:3])


