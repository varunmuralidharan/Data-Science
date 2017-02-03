
getwd()
movie<-read.csv("Movie-Ratings.csv")
head(movie)
colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")
str(movie)


summary(movie)

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)
summary(movie)

#Aesthetics-------------------------------------------------

library(ggplot2)


ggplot(data=movie,aes(x=criticsratings,y=audiencerating))



#Adding geometry--------------------------------------------

ggplot(data=movie,aes(x=criticsratings,y=audiencerating)) + geom_point()




#Colour------------------------------------------------------

ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre)) + geom_point()




#Size----------------------------------------------------------


ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre,size=genre)) + geom_point()




#Size-in  better way---------------------------------------------------------


ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre,size=budgetmillions)) + geom_point()


