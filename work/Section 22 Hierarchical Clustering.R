#Hierarchical Clustering
setwd("C:\\Users\\HP\\Desktop\\Machine learning")

dataset=read.csv('Mall_Customers.csv')
x=dataset[4:5]

#Using the Dendogram to find the optimal no. of clusters
dendogram = hclust(dist(x,method='euclidean'), method='ward.D')
plot(dendogram,
     main='dendogram', 
     xlab='customers',
     ylab='euclidean distance')

#Fitting hierarchical dataset to mall data
hc = hclust(dist(x,method='euclidean'), method='ward.D')

y_hc=cutree(hc,5)

#Visualizing the clusters (Only for 2 dimensions if more dimensions then apply dimensionality reduction)
library(cluster)
clusplot(x,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels=2,
         plotchar=FALSE,
         span=TRUE,
         main=paste("Cluster of clients"),
         xlab="Anual Income",
         ylab="Spending Score")

