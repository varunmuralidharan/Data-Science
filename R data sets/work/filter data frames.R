





#set WD and Read Data

setwd("C:\\Users\\HP\\Desktop\\R data sets")
getwd()



stat<-read.csv("DemographicData.csv")
stat

#--------------------------------------------------------------------------------------------------------


nrow(stat)

#imported 195 rows
ncol(stat)
#import 5 cols

#display top 5
head(stat,n=10)

#display last 5
tail(stat)

#structure of data set

str(stat)
#?runif()

#summary of data set
summary(stat)






#filtering data frames------------------very important-------------------------
head(stat)
filter<-stat$Internet.users<2  #displays true/false all
stat[filter,]


stat[stat$Birth.rate>40,]

stat[stat$Birth.rate>40 & stat$Internet.users<2,]
stat[stat$Income.Group=="High income",]
levels(stat$Income.Group)





stat[stat$Country.Name=="Malta",]
