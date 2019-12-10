# -*- coding: utf-8 -*-
"""
Created on Tue Apr 23 16:55:51 2019

@author: Varun Muralidharan
"""


#-----------------------Clustering -----------------------------------------------------------------------------


import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


os.chdir("D:/harddisc/UTD/Programming for Data Science/project")

data=pd.read_csv("data 1.csv")

data.head()
# 0 id
#1 name 

#13 14 catgegorical
fd = pd.concat([data.iloc[:,[0,1,2,8,10,11,12,13,14,18,19]], data.iloc[:,46:75], data.iloc[:,15]], axis=1)
fd.shape

fd=fd.loc[:,fd.columns!='Name']

fd=fd.loc[:,fd.columns!='Weight']
fd=fd.loc[:,fd.columns!='Height']
fd=fd.loc[:,fd.columns!='Special']
#fd=fd.loc[:,fd.columns!='Weak Foot']
#fd=fd.loc[:,fd.columns!='Skill Moves']
#fd=fd.loc[:,fd.columns!='attack_Work_Rate']
#fd=fd.loc[:,fd.columns!='defense_workrate']
fd_id=fd.iloc[:,0]
fd=fd.iloc[:,1:]
fd_position=fd.iloc[:,35]
fd=fd.iloc[:,:35]



#X=fd.iloc[:,0:30]
#Y=fd.iloc[:,30]
fd.iloc[:,0]=pd.to_numeric(fd.iloc[:,0], downcast='float')
# taking out age
#fd=fd.iloc[:,1:]
fd.iloc[:,0]=np.reciprocal(fd.iloc[:,0])

# not needed as of now
from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_fd=LabelEncoder()
fd.iloc[:,5]=labelencoder_fd.fit_transform(fd.iloc[:,5])
fd.iloc[:,4]=labelencoder_fd.fit_transform(fd.iloc[:,4])

#X_id=X.iloc[:,0]
#X=X.iloc[:,1:]



from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
fd=sc.fit_transform(fd)





# PCA
from sklearn.decomposition import PCA
pca=PCA(n_components=17) # replace by number of pc
d=pca.fit_transform(fd)

explained_variance=pca.explained_variance_ratio_





from sklearn.cluster import KMeans
wcss=[]
for i in range(1,17):
    kmeans=KMeans(n_clusters=i,init='k-means++',max_iter=300,n_init=10)
    kmeans.fit(d)
    wcss.append(kmeans.inertia_)
plt.plot(range(1,17),wcss)
plt.show()

kmeans=KMeans(n_clusters=3,init='k-means++',max_iter=300,n_init=10)
y_kmeans=kmeans.fit_predict(d)


# Visualizing clusters 
plt.scatter(d[y_kmeans==0,0],d[y_kmeans==0,1],s=10,c='red',label='Good')
plt.scatter(d[y_kmeans==1,0],d[y_kmeans==1,1],s=10,c='blue',label='Average')
plt.scatter(d[y_kmeans==2,0],d[y_kmeans==2,1],s=10,c='green',label='Best')
#plt.scatter(d[y_kmeans==3,0],d[y_kmeans==3,1],s=10,c='cyan',label='Cluster 3')
#plt.scatter(d[y_kmeans==4,0],d[y_kmeans==4,1],s=10,c='magenta',label='Cluster 4')
#plt.scatter(d[y_kmeans==5,0],d[y_kmeans==5,1],s=10,c='gray',label='Cluster 5')
#plt.scatter(d[y_kmeans==6,0],d[y_kmeans==6,1],s=10,c='orange',label='Cluster 6')
#plt.scatter(d[y_kmeans==7,0],d[y_kmeans==7,1],s=10,c='black',label='Cluster 7')

plt.scatter(kmeans.cluster_centers_[:,0],kmeans.cluster_centers_[:,1],s=30,c='yellow',label='Centroids')

plt.legend()
plt.show()


# cluster 3

cluster_map = pd.DataFrame()
cluster_map['data_index'] = data.index.values
cluster_map['cluster'] = kmeans.labels_

#cluster_map[cluster_map.cluster]

final=pd.concat([data.iloc[:,[0,1,3,6,7,15]], cluster_map.cluster], axis=1)

# best
cl=final[final['cluster']==2]

cl['Position'].value_counts().plot.bar(color='purple')
cl['Nationality'].value_counts().head(20).plot.bar(color='purple')

cl['Position'].value_counts().head(20).plot.bar(color='purple')


# Good
cl0=final[final['cluster']==0]

cl0['Position'].value_counts().plot.bar(color='purple')
cl0['Nationality'].value_counts().head(20).plot.bar(color='purple')
#cl0['Value'].value_counts().head(20).plot.bar(color='purple')
cl0['Position'].value_counts().head(20).plot.bar(color='purple')

# Average
cl1=final[final['cluster']==1]

cl1['Position'].value_counts().plot.bar(color='purple')
cl1['Nationality'].value_counts().head(20).plot.bar(color='purple')
#cl1['Value'].value_counts().head(20).plot.bar(color='purple')
cl1['Position'].value_counts().head(20).plot.bar(color='purple')

