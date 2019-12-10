# -*- coding: utf-8 -*-
"""
Created on Fri Apr 19 23:48:22 2019

@author: Varun Muralidharan
"""

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
fd = pd.concat([data.iloc[:,[0,1,11,12,13,14,18,19]], data.iloc[:,46:75], data.iloc[:,15]], axis=1)
fd.shape

fd=fd.loc[:,fd.columns!='Name']
fd=fd.loc[:,fd.columns!='Weight']

X=fd.iloc[:,0:35]
Y=fd.iloc[:,35]


from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_X=LabelEncoder()
X.iloc[:,3]=labelencoder_X.fit_transform(X.iloc[:,3])
X.iloc[:,4]=labelencoder_X.fit_transform(X.iloc[:,4])




from sklearn.cross_validation import train_test_split
X_train, X_test,y_train,y_test =train_test_split(X,Y,test_size=0.25,random_state=0)

X_train_id=X_train.iloc[:,0]
X_test_id=X_test.iloc[:,0]

X_train=X_train.iloc[:,1:].values
X_test=X_test.iloc[:,1:].values

y_train=y_train.values
y_test=y_test.values



from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)

# KNN

from sklearn.neighbors import KNeighborsClassifier
classifier=KNeighborsClassifier(n_neighbors=5,metric='minkowski',p=2)
classifier.fit(X_train,y_train)

y_pred=classifier.predict(X_test)

from sklearn import metrics
from sklearn.metrics import confusion_matrix
cm=confusion_matrix(y_test,y_pred)

print(metrics.accuracy_score(y_test, y_pred))
cm


# Naive Bayes
from sklearn.naive_bayes import GaussianNB
classifier=GaussianNB()
classifier.fit(X_train,y_train)

y_pred=classifier.predict(X_test)

from sklearn import metrics
cm=confusion_matrix(y_test,y_pred)
print(metrics.accuracy_score(y_test, y_pred))


# Random forest----------------------------------------------------------



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
fd = pd.concat([data.iloc[:,[0,1,11,12,13,14,18,19]], data.iloc[:,46:75], data.iloc[:,15]], axis=1)
fd.shape

fd=fd.loc[:,fd.columns!='Name']
fd=fd.loc[:,fd.columns!='Weight']
fd=fd.loc[:,fd.columns!='Height']
fd=fd.loc[:,fd.columns!='Weak Foot']
fd=fd.loc[:,fd.columns!='Skill Moves']
fd=fd.loc[:,fd.columns!='attack_Work_Rate']
fd=fd.loc[:,fd.columns!='defense_workrate']


X=fd.iloc[:,0:30]
Y=fd.iloc[:,30]

# not needed as of now
from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_X=LabelEncoder()
X.iloc[:,3]=labelencoder_X.fit_transform(X.iloc[:,3])
X.iloc[:,4]=labelencoder_X.fit_transform(X.iloc[:,4])






from sklearn.cross_validation import train_test_split
X_train, X_test,y_train,y_test =train_test_split(X,Y,test_size=0.25,random_state=0)

X_train_id=X_train.iloc[:,0]
X_test_id=X_test.iloc[:,0]

X_train=X_train.iloc[:,1:].values
X_test=X_test.iloc[:,1:].values

y_train=y_train.values
y_test=y_test.values

# dont use if using random forest or tree
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)


# PCA
from sklearn.decomposition import PCA
pca=PCA(n_components=6) # replace by number of pc
X_train=pca.fit_transform(X_train)
X_test=pca.transform(X_test)
explained_variance=pca.explained_variance_ratio_


# End of Preprocessing--------------------------------------------------------------------------------------------------------------------
# KNN

from sklearn.neighbors import KNeighborsClassifier
classifier=KNeighborsClassifier(n_neighbors=5,metric='minkowski',p=2)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))

# SVM Linear
from sklearn.svm import SVC
classifier=SVC(kernel='linear',random_state=0)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


# SVM poly
from sklearn.svm import SVC
classifier=SVC(kernel='poly',random_state=0,degree=3)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


# Decision Tree classifier
from sklearn.tree import DecisionTreeClassifier
classifier=DecisionTreeClassifier(criterion='entropy',random_state=0)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))



# Random Forest Classifier
from sklearn.ensemble import RandomForestClassifier
classifier=RandomForestClassifier(n_estimators=10,criterion='entropy')
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)


from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


cm=confusion_matrix(y_test,y_pred)




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

# taking out age
fd=fd.iloc[:,1:]

# not needed as of now
from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_fd=LabelEncoder()
fd.iloc[:,3]=labelencoder_fd.fit_transform(fd.iloc[:,3])
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



d=X

from sklearn.cluster import KMeans
wcss=[]
for i in range(1,17):
    kmeans=KMeans(n_clusters=i,init='k-means++',max_iter=300,n_init=10)
    kmeans.fit(d)
    wcss.append(kmeans.inertia_)
plt.plot(range(1,17),wcss)
plt.show()

kmeans=KMeans(n_clusters=5,init='k-means++',max_iter=300,n_init=10)
y_kmeans=kmeans.fit_predict(d)


# Visualizing clusters 
plt.scatter(d[y_kmeans==0,0],d[y_kmeans==0,1],s=100,c='red',label='Cluster 1')
plt.scatter(d[y_kmeans==1,0],d[y_kmeans==1,1],s=100,c='blue',label='Cluster 2')
plt.scatter(d[y_kmeans==2,0],d[y_kmeans==2,1],s=100,c='green',label='Cluster 3')
plt.scatter(d[y_kmeans==3,0],d[y_kmeans==3,1],s=100,c='cyan',label='Cluster 4')
plt.scatter(d[y_kmeans==4,0],d[y_kmeans==4,1],s=100,c='magenta',label='Cluster 5')
plt.scatter(kmeans.cluster_centers_[:,0],kmeans.cluster_centers_[:,1],s=300,c='yellow',label='Centroids')
plt.title('Cluster of Clients')
plt.xlabel('Annual incom')
plt.xlabel('Annual incom')
plt.legend()
plt.show()




# PCA
from skleanr.decomposition import PCA
pca=PCA(n_components=None) # replace by number of pc
X_train=pca.fit_transform(X_train)
X_test=pca.transform(X_test)
explained_variance=pca.explained_variance_ratio_



#---- Try by adding more variales---------------------------------------------------------------------------------------------

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
fd = pd.concat([data.iloc[:,[0,1,11,12,13,14,18,19]], data.iloc[:,46:75], data.iloc[:,15]], axis=1)
fd.shape

fd=fd.loc[:,fd.columns!='Name']

#fd=fd.loc[:,fd.columns!='Weight']
#fd=fd.loc[:,fd.columns!='Height']
#fd=fd.loc[:,fd.columns!='Weak Foot']
#fd=fd.loc[:,fd.columns!='Skill Moves']
#fd=fd.loc[:,fd.columns!='attack_Work_Rate']
#fd=fd.loc[:,fd.columns!='defense_workrate']


X=fd.iloc[:,0:36]
Y=fd.iloc[:,36]

# not needed as of now
from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_X=LabelEncoder()
X.iloc[:,3]=labelencoder_X.fit_transform(X.iloc[:,3])
X.iloc[:,4]=labelencoder_X.fit_transform(X.iloc[:,4])






from sklearn.cross_validation import train_test_split
X_train, X_test,y_train,y_test =train_test_split(X,Y,test_size=0.25,random_state=0)

X_train_id=X_train.iloc[:,0]
X_test_id=X_test.iloc[:,0]

X_train=X_train.iloc[:,1:].values
X_test=X_test.iloc[:,1:].values

y_train=y_train.values
y_test=y_test.values

# dont use if using random forest or tree
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
X_train=sc.fit_transform(X_train)
X_test=sc.transform(X_test)


# PCA
from sklearn.decomposition import PCA
pca=PCA(n_components=8) # replace by number of pc
X_train=pca.fit_transform(X_train)
X_test=pca.transform(X_test)
explained_variance=pca.explained_variance_ratio_


# End of Preprocessing--------------------------------------------------------------------------------------------------------------------
# KNN

from sklearn.neighbors import KNeighborsClassifier
classifier=KNeighborsClassifier(n_neighbors=5,metric='minkowski',p=2)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))

# SVM Linear
from sklearn.svm import SVC
classifier=SVC(kernel='linear',random_state=0)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


# SVM poly
from sklearn.svm import SVC
classifier=SVC(kernel='poly',random_state=0,degree=3)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


# Decision Tree classifier
from sklearn.tree import DecisionTreeClassifier
classifier=DecisionTreeClassifier(criterion='entropy',random_state=0)
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)

from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))



# Random Forest Classifier
from sklearn.ensemble import RandomForestClassifier
classifier=RandomForestClassifier(n_estimators=10,criterion='entropy')
classifier.fit(X_train,y_train)
y_pred=classifier.predict(X_test)


from sklearn import metrics
print(metrics.accuracy_score(y_test, y_pred))


cm=confusion_matrix(y_test,y_pred)

#--------------------nxt---------------------------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------------------------------
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
fd = pd.concat([data.iloc[:,[0,1,2,8,10,11,12,13,14,18,19]], data.iloc[:,20:75], data.iloc[:,15]], axis=1)
fd.shape

fd=fd.loc[:,fd.columns!='Name']

fd_id=fd.iloc[:,0]
fd=fd.iloc[:,1:]

from sklearn.preprocessing import OneHotEncoder,LabelEncoder
labelencoder_fd=LabelEncoder()
fd.iloc[:,5]=labelencoder_fd.fit_transform(fd.iloc[:,5])
fd.iloc[:,6]=labelencoder_fd.fit_transform(fd.iloc[:,6])

# removing position suitable
fd_position=fd.iloc[:,64]
fd=fd.iloc[:,0:64]

from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
fd=sc.fit_transform(fd)



# PCA
from sklearn.decomposition import PCA
pca=PCA(n_components=11) # replace by number of pc
d=pca.fit_transform(fd)

explained_variance=pca.explained_variance_ratio_



d

from sklearn.cluster import KMeans
wcss=[]
for i in range(1,12):
    kmeans=KMeans(n_clusters=i,init='k-means++',max_iter=300,n_init=11)
    kmeans.fit(d)
    wcss.append(kmeans.inertia_)
plt.plot(range(1,12),wcss)
plt.show()

kmeans=KMeans(n_clusters=5,init='k-means++',max_iter=300,n_init=10)
y_kmeans=kmeans.fit_predict(d)


# Visualizing clusters 
plt.scatter(d[y_kmeans==0,0],d[y_kmeans==0,1],s=100,c='red',label='Cluster 1')
plt.scatter(d[y_kmeans==1,0],d[y_kmeans==1,1],s=100,c='blue',label='Cluster 2')
plt.scatter(d[y_kmeans==2,0],d[y_kmeans==2,1],s=100,c='green',label='Cluster 3')
plt.scatter(d[y_kmeans==3,0],d[y_kmeans==3,1],s=100,c='cyan',label='Cluster 4')
plt.scatter(d[y_kmeans==4,0],d[y_kmeans==4,1],s=100,c='magenta',label='Cluster 5')
plt.scatter(kmeans.cluster_centers_[:,0],kmeans.cluster_centers_[:,1],s=300,c='yellow',label='Centroids')
plt.title('Cluster of Clients')
plt.xlabel('Annual incom')
plt.ylabel('Annual incom')
plt.legend()
plt.show()

