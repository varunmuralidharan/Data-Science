#Random Forest Regression

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





#Fitting Random Forest Regression to the dataset
#install.packages("randomForest")
library(randomForest)
set.seed(1234)
regressor=randomForest(x=dataset[1],y=dataset$Salary,ntree = 1000)


#Predicting New Results 
ypred=predict(regressor,newdata = data.frame(Level=6.5))





#Visualizing Random Forest Regression Model Result ---we create a sequence to smooth the visualization (higher resolution)
#....now we can see 5.4,3.3 values also. Since its a sequence we convert into data.framein line 62
#install.packages("ggplo2")
library(ggplot2)
xgrid=seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=xgrid,y=predict(regressor,newdata = data.frame(Level=xgrid))),color="BLUE") +
  ggtitle("Truth or Bluff--- Random Forest Regression") +xlab("levels") + ylab("Salary")

