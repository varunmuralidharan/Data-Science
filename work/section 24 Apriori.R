#Apriori
setwd("C:\\Users\\HP\\Desktop\\Machine learning")





#Data Preprocessing
#install.packages('arules')
library(arules)
dataset= read.csv('Market_Basket_Optimisation.csv' , header = FALSE)

#Rule based needs sparse matrix therefore we use read transactions
dataset= read.transactions('Market_Basket_Optimisation.csv' , sep=',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN=10)


#Training Apriori on dataset
#support 3*7/7500 rounded ---3 times a day in a week /total transactions in that week
rules=apriori(data=dataset , parameter=list(support=0.003 , confidence= 0.4))

#Visualizing the results
inspect(sort(rules , by='lift')[1:10])


#OR-------------------------------------------------------------------------------------------------------------

#support 3*7/7500 rounded ---3 times a day in a week /total transactions in that week
rules=apriori(data=dataset , parameter=list(support=0.003 , confidence= 0.2))

#Visualizing the results
inspect(sort(rules , by='lift')[1:10])


#OR--------------------------------------------------------------------------------------------------------------
#support 4*7/7500 rounded ---4 times a day in a week /total transactions in that week
rules=apriori(data=dataset , parameter=list(support=0.004 , confidence= 0.2))

#Visualizing the results
inspect(sort(rules , by='lift')[1:10])
