setwd("D:\\harddisc\\Machine learning")
dataset=read.csv('Social_Network_Ads.csv')

dataset=dataset[3:5]

dataset$Purchased=factor(dataset$Purchased,levels=c(0,1))

library(caTools)

set.seed(123)
split=sample.split(dataset$Purchased,SplitRatio = 0.75)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)



training_set[-3]=scale(training_set[-3]) 
test_set[-3]=scale(test_set[-3])


#Fitting Kernel SVM to Training Set
# install.packages('e1071')
library(e1071)
classifier=svm(formula=Purchased~. ,  data=training_set , type='C-classification' , kernel='radial')

#Predicting Test Set results  response-probabilities result in single vector
ypred=predict(classifier,newdata = test_set[-3])

#Evaluation by Confusion Matrix 10+7 incorrect prediction and 57+26 correct predictions
cm=table(test_set[,3],ypred)


# creating k folds cross validation------------------------------------------------------------------

#install.packages('caret')
library(caret)

folds=createFolds(training_set$Purchased,k=10)

cv=lapply(folds,function(x){
  
  training_fold=training_set[-x, ]
  test_fold=training_set[x, ]
  classifier=svm(formula=Purchased~. ,  data=training_fold , type='C-classification' , kernel='radial')
  ypred=predict(classifier,newdata = test_fold[-3])
  cm=table(test_fold[,3],ypred)
  accuracy=(cm[1,1]+cm[2,2])/(cm[1,1]+cm[2,2]+cm[1,2]+cm[2,1])
  return(accuracy)
})


accuracy=mean(as.numeric(cv))


#applying grid search approach---------------------------------------------------------------
library(caret)
classifier=train(form= Purchased~.,data=training_set ,method='svmRadial')

classifier

classifier$bestTune
