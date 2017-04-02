
getwd()
movie<-read.csv("Movie-Ratings.csv")
head(movie)
colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillons","releasingyear")
str(movie)


summary(movie)

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)
summary(movie)




