qnorm(.09,mean=0,sd=1)
qnorm(.93,mean=0,sd=1)
qnorm(.06,mean=0,sd=1)
qnorm(.04,mean=0,sd=1)
#-1.75,+1.75
pnorm(1.7)
1-pnorm(2.1)
pnorm(-1.7)
2*pnorm(-1.3)


#df=15
qt(.09,df=15)
qt(.93,df=15)
qt(.03,df=15)
qt(.04,df=15)

pt(1.7,df=15)
1-pt(2.1,df=15)
pt(-1.7,df=15)
2*pt(-1.3,df=15)

#df=1500
qt(.09,df=1500)
1-pt(2.1,df=1500)


ourData=read_csv("hw_1_dataset_2.csv")
therm=ourData$`Temperature(F)`
mean(therm)

toptherm=therm[1:20]
mean(toptherm)

t.test(toptherm,conf.level = .95)$"conf.int"
t.test(toptherm,conf.level = .99)$"conf.int"
t.test(toptherm,conf.level = .90)$"conf.int"

toptemp=therm[1:200]
mean(toptemp)
t.test(toptemp,conf.level = .95)$"conf.int"
