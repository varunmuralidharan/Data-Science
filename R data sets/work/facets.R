setwd("C:\\Users\\HP\\Desktop\\R data sets")
movie<-read.csv("Movie-Ratings.csv")

colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)

library(ggplot2)



#Using Facets

v<-ggplot(data=movie,aes(x=budgetmillions))

v+geom_histogram(binwidth=10,aes(fill=genre),color="Black")


#Facets---columns is genre

v+geom_histogram(binwidth=10,aes(fill=genre),color="Black") + facet_grid(.~genre)


#Facets---rows is genre

v+geom_histogram(binwidth=10,aes(fill=genre),color="Black") + facet_grid(genre~.)

#since every y axis has same measures(10,20,30....) its not accurate...therefore we 
#dynamically let R to allocate measures for each of facets (here genre) 

v+geom_histogram(binwidth=10,aes(fill=genre),color="Black") + facet_grid(genre~.
                                                                         ,scales="free")
#Applying facets to scatter plots

w<-ggplot(data=movie,aes(x=criticsratings,y=audiencerating,color=genre))
w+geom_point(size=3)

#as rows

w+geom_point(size=3)+facet_grid(genre~.)

#as columns

w+geom_point(size=3)+facet_grid(.~releasingyear)

#both combined
w+geom_point(size=3)+facet_grid(genre~releasingyear)

#using smooth here
w+geom_point(size=3)+geom_smooth()+facet_grid(genre~releasingyear)


w+geom_point(data=movie,aes(size=budgetmillions))+geom_smooth()+facet_grid(genre~releasingyear)


#since for some y axis there are negative measures due to smooth ----doing more refining
#reffer coordinates for further refinement
