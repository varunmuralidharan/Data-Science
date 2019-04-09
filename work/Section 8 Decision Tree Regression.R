#Decision Tree Regression

#Decision Tree 


#Data Preprocessing



getwd()
setwd("C:\\Users\\HP\\Desktop\\Machine learning")
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





#Fitting Decision Tree  to the dataset
#install.packages("rpart")
library(rpart)
regressor=rpart(formula=Salary~.,data=dataset,control=rpart.control(minsplit = 1))


#Predicting New Results 
ypred=predict(regressor,newdata = data.frame(Level=6.5))


library(ggplot2)
#Visualizing Decision Tree  Result ---we use better resolution here to get better split instead of the regular visualisation in regression template
xgrid=seq(min(dataset$Level),max(dataset$Level),0.01)

ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=xgrid,y=predict(regressor,newdata = data.frame(Level=xgrid))),color="BLUE") +
  ggtitle("Truth or Bluff--- Decision Tree") +xlab("levels") + ylab("Salary")


