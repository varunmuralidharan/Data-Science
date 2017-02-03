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


#Add Colour--------

#1. Mapping

r+geom_point(aes(color=genre))




#2. Setting

r+geom_point(color="DarkGreen")



#1. Mapping (only if need to show categorical variables....shows legend!!!)

r+geom_point(aes(size=budgetmillions))



#2. Settings (overall size as 10 ...all points!!!)

r+geom_point(size=10)


#Error (wrong answer)

r+geom_point(aes(size=10))



