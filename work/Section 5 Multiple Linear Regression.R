#Multiple Linear Regression

#Data Preprocessing

#Importing the data sets

setwd("D:/harddisc/Machine Learning")
dataset=read.csv('50_Startups.csv')

summary(dataset)
#Encoding Categorical Variables
dataset$State=factor(dataset$State,levels=c('New York','California','Florida'),labels=c(1,2,3))


#dataset=dataset[,2:3]

#Splitting data sets into test sets and training sets


#install.packages('caTools')
library(caTools)

set.seed(123)
split=sample.split(dataset$Profit,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



#Feature scaling


#training_set=scale(training_set)      #this wont work ...will show "is not numeric" since factor variables 
#test_set=scale(test_set)              #are not numeric therefore we specify the columns

#training_set[,2:3]=scale(training_set[,2:3]) 
#test_set[,2:3]=scale(test_set[,2:3])
?lm
regressor = lm(formula = Profit~ R.D.Spend + Administration + Marketing.Spend + State ,
               data=training_set)


# OR (BOTH SAME)

regressor = lm(formula=Profit~. ,data=training_set)


summary(regressor)


# On seeing the summary we can infer that only R&D has 
#significant impact on dependent variable.....othrs are insignificant (ie) has no star ,.......has blank
#therefore we can rewrite the lm as simple linear regression in this case

#will give same result as using  "."
regressor = lm(formula = Profit~ R.D.Spend ,
               data=training_set)


#Predicting Test Set Results

y_pred=predict(regressor,newdata=test_set)


#Building optimal model using Backward Elimination-----SP=5%------------------------------------------------------------------

regressor = lm(formula = Profit~ R.D.Spend + Administration + Marketing.Spend + State ,
               data=dataset)

summary(regressor)

#Since state 2 ,state 3 has 94 % P value we eliminate them
regressor = lm(formula = Profit~ R.D.Spend + Administration + Marketing.Spend  ,
               data=dataset)

summary(regressor)

#Removing administration since it has 60% p
regressor = lm(formula = Profit~ R.D.Spend  + Marketing.Spend  ,
               data=dataset)

summary(regressor)

#Removing Marketing spend since its more than 5 % but we can keep it since its near to 5 % in real life

regressor = lm(formula = Profit~ R.D.Spend,
               data=dataset)

summary(regressor)
