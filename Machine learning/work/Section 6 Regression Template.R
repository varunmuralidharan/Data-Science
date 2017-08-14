#Regression Template


#Polynomial Regression


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





#Fitting Polynomial Regression to the dataset
#Create your regressor here




#Predicting New Results 
ypred=predict(regressor,newdata = data.frame(Level=6.5))



#Visualizing Regression Model Result
#install.packages("ggplo2")
ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)),color="BLUE") +
  ggtitle("Truth or Bluff--- Regression Model") +xlab("levels") + ylab("Salary")





#Visualizing Regression Model Result ---we create a sequence to smooth the visualization (higher resolution)
#....now we can see 5.4,3.3 values also. Since its a sequence we convert into data.framein line 62
#install.packages("ggplo2")
xgrid=seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot() + geom_point(aes(x=dataset$Level,y=dataset$Salary),color="RED") + 
  geom_line(aes(x=xgrid,y=predict(regressor,newdata = data.frame(Level=xgrid))),color="BLUE") +
  ggtitle("Truth or Bluff--- Regression Model") +xlab("levels") + ylab("Salary")

