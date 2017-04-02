setwd("C:\\Users\\HP\\Desktop\\R data sets")
movie<-read.csv("Movie-Ratings.csv")

colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)

library(ggplot2)


t<-ggplot(data=movie,aes(x=audiencerating))

t+geom_histogram(binwidth=10,fill="White",colour="Blue")


#Another way-------
t<-ggplot(data=movie)

t+geom_histogram(binwidth=10,aes(x=audiencerating),fill="White",colour="Blue")


t+geom_histogram(binwidth=10,aes(x=criticsratings),fill="White",colour="Blue")



#skeleton---------------------------------------

t<-ggplot()      #valid----used to create visualization of multiple data sets




