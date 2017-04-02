



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

#-----basic operations------------------------
stat
stat[1:10,] #subsetting
stat[3:9,]
stat[c(4,100),]


stat[1,]
is.data.frame(stat[1,]) #indata frames  no need for drop=F
stat[,1,drop=F]
is.data.frame(stat[,1,drop=F])


#multiply 
head(stat)


round(stat$Birth.rate * stat$Internet.users)
round(stat$Birth.rate + stat$Internet.users)



#adding column to data frames-----------------


head(stat)
stat$newcol<-c(round(stat$Birth.rate * stat$Internet.users))
stat$newcol


#testing my knowledge
stat$mycol2<-1:5
head(stat$mycol2)
head(stat,n=10)
str(stat)

#stat$mycol2<-1:4 shows error

head(stat)
stat$mycol2<-NULL
