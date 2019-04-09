#Logistic Regression
setwd("C:\\Users\\HP\\Desktop\\Machine learning")
dataset=read.csv('Social_Network_Ads.csv')

dataset=dataset[3:5]

#Splitting data sets into test sets and training sets


#install.packages('caTools')
library(caTools)

set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



#Feature scaling


training_set[-3]=scale(training_set[-3]) 
test_set[-3]=scale(test_set[-3])

?glm
#Fitting Classifier Model in Training Set
#Add Classifier here

#Predicting Test Set results  response-probabilities result in single vector
prob_pred=predict(classifier,type='response',newdata = test_set[-3])
ypred=ifelse(prob_pred>0.5,1,0)


#Evaluation by Confusion Matrix 10+7 incorrect prediction and 57+26 correct predictions
cm=table(test_set[,3],ypred)


#Visualization Training set results
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set=training_set
x1=seq(min(set[,1]) - 1 , max(set[,1]) + 1 , by=0.01)
x2=seq(min(set[,2]) - 1 , max(set[,2]) + 1 , by=0.01)
grid_set=expand.grid(x1,x2)
colnames(grid_set)=c('Age' , 'Estimate Salary')
prob_set=predict(classifier , type='response' , newgrid=grid_set)

y_grid=ifelse(prob_set>0.5,1,0)

plot(set[,-3],
     main="Classifier (Training Set)",
     xlab='Age' , ylab='Estimated Salary' , 
     xlim=range(x1) , ylim=range(x2) )

contour(x1,x2,matrix(as.numeric(y_grid),length(x1),length(x2)), add=TRUE)
points(grid_set,pch='.',col=ifelse(y_grid==1,'springgreen3','tomato'))
points(set,pch=21,bg=ifelse(set[,3]==1,'green4','red3'))



#Visualization Test set results
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set=test_set
x1=seq(min(set[,1]) - 1 , max(set[,1]) + 1 , by=0.01)
x2=seq(min(set[,2]) - 1 , max(set[,2]) + 1 , by=0.01)
grid_set=expand.grid(x1,x2)
colnames(grid_set)=c('Age' , 'Estimate Salary')
prob_set=predict(classifier , type='response' , newgrid=grid_set)

y_grid=ifelse(prob_set>0.5,1,0)

plot(set[,-3],
     main="Classifier (Test Set)",
     xlab='Age' , ylab='Estimated Salary' , 
     xlim=range(x1) , ylim=range(x2) )

contour(x1,x2,matrix(as.numeric(y_grid),length(x1),length(x2)), add=TRUE)
points(grid_set,pch='.',col=ifelse(y_grid==1,'springgreen3','tomato'))
points(set,pch=21,bg=ifelse(set[,3]==1,'green4','red3'))

