

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


ggplot(data=movie,aes(x=criticsratings,y=audiencerating))

#Adding geometry--------------------------------------------


ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre,size=budgetmillions)) + geom_point()


#next step improvement----------------------------------------------
#---------------------Plotting with layers-----------------------------

# creating an object-------------------------------------------------------

p<-ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre,size=budgetmillions))

p

#points
p + geom_point()

#lines
p +geom_line()



#multiple layers

p + geom_point() + geom_line()

p + geom_line() + geom_point()



#-more on aesthetics----------------------------

p + geom_point()

p + geom_point(aes(size=criticsratings,alpha=0.6)) 

p + geom_point(aes(colour=budgetmillions,alpha=0.6))

p + geom_point(aes(x=budgetmillions)) + xlab("budget millions")



p + geom_line(size=1) + geom_point()



