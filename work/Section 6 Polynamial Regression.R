#Polynomial Regression


#Data Preprocessing

#Importing the data sets

getwd()
setwd("D:/harddisc/Machine learning")
dataset=read.csv('Position_Salaries.csv')
dataset=dataset[,2:3]

#Splitting data sets into test sets and training sets

#install.packages('caTools')
#library(caTools)

#set.seed(123)
#split=sample.split(dataset$Purchased,SplitRatio = 0.8)
#training_set=subset(dataset,split==TRUE)
#test_set=subset(dataset,split==FALSE)

#Feature scaling


#training_set=scale(training_set)      #this wont work ...will show "is not numeric" since factor variables 
#test_set=scale(test_set)              #are not numeric therefore we specify the columns




#Fitting  Linear Regression to the dataset
linreg=lm(formula=Salary~.,data=dataset)

#Fitting Polynomial Regression to the dataset
#Adding more levels for polynomial regression prediction accuracy
dataset$level2=dataset$Level^2
dataset$level3=dataset$Level^3
dataset$level4=dataset$Level^4  #Added afterwards
polyreg=lm(formula=Salary~.,data=dataset)


#Visualizing Linear Regression Result
#install.packages("ggplot2")
library(ggplot2)

ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=dataset$Level,y=predict(linreg,newdata = dataset)),color="BLUE") +
  ggtitle("Truth or Bluff---Linear Regression") +xlab("levels") + ylab("Salary")



#Visualizing Polynomial Regression Result
ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=dataset$Level,y=predict(polyreg,newdata = dataset)),color="BLUE") +
  ggtitle("Truth or Bluff---Polynomial Regression") +xlab("levels") + ylab("Salary")


#Predicting New Results for 6.5 value only using Linear Regression

ypred=predict(linreg,newdata = data.frame(Level=6.5))


#Predicting New Results using Polynomial Regression

ypred=predict(polyreg,newdata = data.frame(Level=6.5,level2=6.5^2,level3=6.5^3,level4=6.5^4))

