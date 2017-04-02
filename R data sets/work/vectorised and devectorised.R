x <- rnorm(5)
x
for(i in x)
{
  print(i)
}





print(x[1])

print(x[2])

print(x[3])
print(x[4])
print(x[5])





for(j in 1:5)
{
  print(x[j])
}






#....................#

n<-100
a<-rnorm(n)
b<-rnorm(n)


#vectorised approach
c<-a*b

#devectorised approach
d<-rep(NA,n)
for(i in 1:n)
{
  d[i]<- a[i]*b[i]
}

