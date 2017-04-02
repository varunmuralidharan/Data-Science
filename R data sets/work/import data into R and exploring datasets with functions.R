

?read.csv()


#select file manually
stat<-read.csv(file.choose())
stat


#set WD and Read Data

getwd()
setwd("C:\\Users\\HP\\Desktop\\R data sets")
getwd()


rm(stat)
stat<-read.csv("DemographicData.csv")
stat

#--------------------------------------------------------------------------------------------------------


stat
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





