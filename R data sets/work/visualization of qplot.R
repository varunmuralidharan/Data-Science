-----------------#visualization of qplot-----------------------------------

install.packages("ggplot2")
library(ggplot2)

qplot(data=stat,x=Internet.users,y=Birth.rate)

qplot(data=stat,x=Internet.users,y=Birth.rate,size=I(3))
qplot(data=stat,x=Internet.users,y=Birth.rate,size=I(3),colour=I("red"))

#to assign colours to income group
qplot(data=stat,x=Internet.users,y=Birth.rate,size=I(5),colour=Income.Group)
