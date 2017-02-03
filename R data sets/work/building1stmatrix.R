
#matrices

mydata<-1:20
mydata


A<-matrix(mydata,4,5)
A
A[2,3]



B<-matrix(mydata,4,5,byrow=T)
B
B[2,5]



#rbind

r1<-c("i","am","happy")
r3<-c(2,3,5)
r2<-c("what","a","day")


C<-rbind(r1,r2,r3)
C



#cbind

D<-cbind(r1,r2,r3)
D
