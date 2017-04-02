setwd("C:\\Users\\HP\\Desktop\\R data sets")
movie<-read.csv("Movie-Ratings.csv")

colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)

library(ggplot2)


u<-ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre))
u+geom_point()+geom_smooth(fill=NA)


#Box Plots-------------------------------------------------------------------

u<-ggplot(data=movie,aes(x=genre,y=audiencerating,color=genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()



#tip/hack to more ellaborate the points representation in box plot

u+geom_boxplot(size=1.2)+geom_jitter()



#recomended tip

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.6)




#mini work
u<-ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=criticsratings))
u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.6)

