setwd("G:/Projects/R scripts/elections 2015")
data <- read.csv("elections.csv")
#Buddhist sentiment is .6
data$buddhist.votes<-(data$Buddhist/100)*data$Reg*.6
#Polannaruwa district sentiment is .45
data[18,]$buddhist.votes<-(data[18,]$Buddhist/100)*data[18,]$Reg*.45
#Hindu sentiment is .1
data$hindu.votes<-(data$Hindu/100)*data$Reg*.1
#Islam sentiment is .1
data$islam.votes<-(data$Islam/100)*data$Reg*.1
#Christian sentiment is .4 (for vanni, jaffnam baticaloa and trinco .1)
data$christian.votes<-(data$Christianity/100)*data$Reg*.4
#vanni
data[11,]$christian.votes<-(data[11,]$Christianity/100)*data[11,]$Reg*.1
#jaffna
data[10,]$christian.votes<-(data[10,]$Christianity/100)*data[10,]$Reg*.1
#Batticaloa
data[12,]$christian.votes<-(data[12,]$Christianity/100)*data[12,]$Reg*.1
#Trincomalee
data[14,]$christian.votes<-(data[14,]$Christianity/100)*data[14,]$Reg*.1
#total votes Mahinda
data$mahinda.votes<-data$buddhist.votes+data$hindu.votes+data$islam.votes+data$christian.votes
#Total votes my3
data$my3.votes<-data$Reg-data$mahinda.votes
#Mahinda %
data$mahinda.pc<-(data$mahinda.votes/data$Reg)*100
#my3 %
data$my3.pc<-(data$my3.votes/data$Reg)*100

data$diff<-data$mahinda.pc-data$my3.pc
data$diff.votes<-data$mahinda.votes-data$my3.votes
sum(data$diff)
sum(data$diff.votes)
sum(data$mahinda.votes)/sum(data$Reg.Votes)
sum(data$my3.votes)/sum(data$Reg.Votes)
sum(data$Reg.Votes)
sum(data$mahinda.votes)
sum(data$my3.votes)

summary(data$mahinda.pc)
summary(data$my3.pc)
write.csv(file="results60.csv", x=data)
