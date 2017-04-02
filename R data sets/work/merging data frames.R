


setwd("C:\\Users\\HP\\Desktop\\R data sets")
stat<-read.csv("DemographicData.csv")
mydf<-data.frame(country=Countries_2012_Dataset,code=Codes_2012_Dataset,region=Regions_2012_Dataset)
mydf
head(mydf)


#-------merging data frames-----------------
head(stat)
?merge()

merged<-merge(stat,mydf,by.x="Country.Code",by.y="code")
merged
merged$country<-NULL
str(merged)



tail(merged)
