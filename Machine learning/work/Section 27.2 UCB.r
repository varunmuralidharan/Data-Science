#Upper Confidence Bound
setwd("C:\\Users\\HP\\Desktop\\Machine learning")

#Importing Dataset
dataset=read.csv('Ads_CTR_Optimisation.csv')



#Implementing UCB
N=1000
d=10

ads_selected = integer(0)
number_of_selections = integer(d)
sum_of_rewards = integer(d)
total_reward=0
for(n in 1:N){
  max_upper_bound = 0
  ad=0
  for(i in 1:d ){
    if(number_of_selections[i]>0){
    average_rewards = sum_of_rewards[i]/number_of_selections[i]
    delta_i=sqrt(3/2 * log(n) / number_of_selections)
    upper_bound=average_rewards + delta_i
    }
    else{
      upper_bound = 1e400
    }
    if(upper_bound>max_upper_bound){
      max_upper_bound = upper_bound
      ad=i
    }
  } 
  ads_selected=append(ads_selected,ad)
  number_of_selections[ad]=number_of_selections[ad]+ 1
  reward = dataset[n,ad]
  sum_of_rewards[ad] = sum_of_rewards[ad] +reward
  total_reward=total_reward + reward
  }