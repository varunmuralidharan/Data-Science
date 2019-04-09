#Data Preprocessing

#Importing the data sets

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


?svm


#Fitting SVR to the dataset
#install.packages("e1071")
library(e1071)
regressor = svm(formula=Salary ~. , data=dataset , type='eps-regression' )


#Predicting New Results 
ypred=predict(regressor,newdata = data.frame(Level=6.5))



#Visualizing SVR Model Result
#install.packages("ggplo2")
library(ggplot2)
ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)),color="BLUE") +
  ggtitle("Truth or Bluff--- SVR Model") +xlab("levels") + ylab("Salary")





