setwd("C:\\Users\\HP\\Desktop\\R data sets")
stat<-read.csv("DemographicData.csv")
#--------$ symbol

stat
head(stat)
stat[3,3]
stat[3,"Birth.rate"]


stat$Internet.users
stat$Internet.users[2]



#to know the levels in Income group column


levels(stat$Income.Group)
