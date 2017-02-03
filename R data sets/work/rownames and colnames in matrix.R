charlie<-1:5
charlie
names(charlie)<-c("a","b","c","d","e")
charlie
charlie["d"]
names(charlie)


#clear names

names(charlie)<-NULL


#for matrices


tempvec<-rep(c("a","b","zZ"),each=3)
tempvec


bravo<-matrix(tempvec,3,3)
bravo

rownames(bravo)<-c("how","are","you")
bravo


colnames(bravo)<-c("x","y","z")
bravo



bravo["how","z"]<-0
bravo

rownames(bravo)<-NULL
bravo
