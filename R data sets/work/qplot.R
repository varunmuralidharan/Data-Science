#---------introduction to qplot----------

install.packages("ggplot2")
library(ggplot2)
?qplot


qplot(data=stat,x=Internet.users)
qplot(data=stat,x=Income.Group,y=Birth.rate)
qplot(data=stat,x=Income.Group,y=Birth.rate,size=3)
qplot(data=stat,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=stat,x=Income.Group,y=Birth.rate,size=I(10))
qplot(data=stat,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=stat,x=Income.Group,y=Birth.rate,geom="boxplot")

-----------------#visualization of qplot-----------------------------------

qplot(data=stat,x=Internet.users,y=Birth.rate)
