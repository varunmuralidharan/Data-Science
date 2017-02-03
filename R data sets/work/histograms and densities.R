
setwd("C:\\Users\\HP\\Desktop\\R data sets")
movie<-read.csv("Movie-Ratings.csv")
head(movie)
colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)
summary(movie)

#Aesthetics-------------------------------------------------

library(ggplot2)


r<-ggplot(data=movie,aes(x=criticsratings,y=audiencerating))

r+geom_point()



#------Histograms and density charts-------------


s<-ggplot(data=movie,aes(x=budgetmillions))
s+geom_histogram(binwidth=10)


#---Adding color----------

#1.Setting color-

s+geom_histogram(binwidth=10,fill="Green")


#2.Mapping color-

s+geom_histogram(binwidth=10,aes(fill=genre))


# add border to increase visibility-----Color in Histogram adds border----------
s+geom_histogram(binwidth=10,aes(fill=genre),color="Black")








#Density charts---------------------------------------------------------


s+geom_density()
s+geom_density(aes(fill=genre))
s+geom_density(aes(fill=genre),position ="stack")
