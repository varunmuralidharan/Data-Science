#K Means Clustering

setwd("C:\\Users\\HP\\Desktop\\Machine learning")

#Importing data set
dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5] 


#Using Ebow Method to find optimal number of clusters #Explore withinss
set.seed(6)
wcss<-vector()

for(i in 1:10) wcss[i]<-sum(kmeans(x,i)$withinss)
plot(1:10 , wcss,type='b' , main=paste("cluster of clients") , 
     xlab = "No of clusters" ,
     ylab = "WCSS")

#We can infer from graph as 5 clusters
set.seed(29)
kmeans<-kmeans(x , 5 , iter.max=300 , nstart= 10)


#Visualizing the clusters (Only for 2 dimensions if more dimensions then apply dimensionality reduction)
library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste("Cluster of clients"),
         xlab="Anual Income",
         ylab="Spending Score")