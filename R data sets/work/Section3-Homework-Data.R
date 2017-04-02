#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profit <-rep(na , 12)

tax<- .30*revenue


revafttax<-revenue - tax

 
profit <-revenue  - (tax+expenses)
round(profit)
profitmarg<- profit/revenue
round(profitmarg,0)

mp<-mean(profit)

for(i in 1:12)
{
  if(profit[i]>mp)
  {
    print(i)
  }
  
}




print("worst month")

mini<-min(profit)
mini

print("best month")

maxi<-max(profit)
maxi


print("bad months")
for(j in 1:12)
{
  if(profit[j]<mp)
   { print(j)}
  
}