#Simple Data Regression

#Importing the data sets

getwd()
setwd("C:\\Users\\HP\\Desktop\\Machine learning")
dataset=read.csv('Salary_Data.csv')

#Here dependent variable is Salary and independent variable is years of experience


#Splitting data sets into test sets and training sets

#Initially taking 20 observations in training set and rest 10 observations in test set

#install.packages('caTools')
library(caTools)

set.seed(123)
split=sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Here no need of feture scaling since linear regression takes care of this .................................

#Feature scaling

#training_set[,2:3]=scale(training_set[,2:3]) 
#test_set[,2:3]=scale(test_set[,2:3])


#Fitting Simple Linear Regression to Training Set
?lm
#Salary is proportional to year of experience & data is the training set
regressor = lm(formula= Salary~YearsExperience , data=training_set)

summary(regressor)


#Predicting the test set result.

y_pred=predict(regressor,newdata=test_set)


#Visualization the Training set Result(Will get the good result)

#install.packages('ggplot2')
?xlab

library(ggplot2)

ggplot()+geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),color='red') + 
                          geom_line(aes(x=training_set$YearsExperience , y= predict(regressor,newdata=training_set)),color='blue') +
                          ggtitle('Salary vs Years Experience(Training set)')  + labs(x="YearsExperience") +
  labs(y="Salary")
  
#Visualizatio for test set (Actual Final result)

ggplot()+geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),color='red') + 
  geom_line(aes(x=training_set$YearsExperience , y= predict(regressor,newdata=training_set)),color='blue') +
  ggtitle('Salary vs Years Experience(Test set)')  + labs(x="YearsExperience") +
  labs(y="Salary")


