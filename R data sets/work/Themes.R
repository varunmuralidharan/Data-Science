setwd("C:\\Users\\HP\\Desktop\\R data sets")
movie<-read.csv("Movie-Ratings.csv")

colnames(movie)<-c("film","genre","criticsratings","audiencerating","budgetmillions","releasingyear")

#converting non factor variables to factors-------------------------------------------------------------
factor(movie$releasingyear)
movie$releasingyear<-factor(movie$releasingyear)
str(movie)

library(ggplot2)

#Themes-------------------------------
o<-ggplot(data=movie,aes(x=budgetmillions))
h<-o+geom_histogram(binwidth = 10,aes(fill=genre),color="Black")
h


#axes lable formating


h+xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(size = 30,color="Green")
        ,axis.title.y=element_text(size=30,color="Blue"))

#tick mark formating


h+xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(size = 30,color="Green")
        ,axis.title.y=element_text(size=30,color="Blue"),
        axis.text.x=element_text(size=20),
        axis.text.y = element_text(size=20))

#Legend formating

h+xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(size = 30,color="Green")
        ,axis.title.y=element_text(size=30,color="Blue"),
        axis.text.x=element_text(size=20),
        axis.text.y = element_text(size=20),legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#Title

h+xlab("Money Axis") + ylab("Number of Movies") + 
  ggtitle("Movie Distribution")+
  theme(axis.title.x = element_text(size = 30,color="Green")
        ,axis.title.y=element_text(size=30,color="Blue"),
        axis.text.x=element_text(size=20),
        axis.text.y = element_text(size=20),legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(size=20,color="Dark Blue"  #,family = "Courier"
                                  ))

?theme



