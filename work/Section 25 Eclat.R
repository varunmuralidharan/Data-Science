#ECLAT

setwd("C:\\Users\\HP\\Desktop\\Machine learning")

#Data Preprocessing
#install.packages('arules')
library(arules)
dataset= read.csv('Market_Basket_Optimisation.csv' , header = FALSE)

dataset= read.transactions('Market_Basket_Optimisation.csv' , sep=',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN=10)


#Training  Eclat on dataset-------------------------------------------------------------------------------------------------------
#support 4*7/7500 rounded ---3 times a day in a week /total transactions in that week
rules=eclat(data=dataset , parameter=list(support=0.004 , minlen = 2))

#shows no. of sets instead of Rules ----------unlike apriori

#Visualizing the results
inspect(sort(rules , by='support')[1:10])


#shows same o/p more or less even after changing support to 3% this is because of the dataset
#simpler model for simple information than apriori
rules=eclat(data=dataset , parameter=list(support=0.003 , minlen = 2))

#shows no. of sets instead of Rules ----------unlike apriori

#Visualizing the results
inspect(sort(rules , by='support')[1:10])
