



myplot<- function(rows){
  Data<-Salary[rows,,drop=F]
  matplot(t(Salary),type="b",pch=15:18 , col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6) ,pch=15:18,horiz=F)
}

myplot(1:2)





#passing matrice as parameter
myplot<- function(data,rows){
Data<-data[rows,,drop=F]
matplot(t(Data),type="b",pch=15:18 , col=c(1:4,6))
legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6) ,pch=15:18,horiz=F)
}

myplot(Salary,1:2)


#default parameter


myplot<- function(data,rows=1:10){
  Data<-data[rows,,drop=F]
  matplot(t(Data),type="b",pch=15:18 , col=c(1:4,6))
  legend("bottomleft",inset=0.01,legend=Players[rows],col=c(1:4,6) ,pch=15:18,horiz=F)
}

myplot(Salary)


