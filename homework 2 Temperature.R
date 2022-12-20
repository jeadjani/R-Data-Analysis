ourData = read_csv(file = "hw_1_dataset_2.csv")
therm= ourData$`Temperature(F)`

length(therm)
summary(therm)
median(therm)
sd(therm)
mean(therm)

min(therm)
max(therm)



(min(therm) - mean(therm))/sd(therm)
(max(therm) - mean(therm))/sd(therm)


sum(therm<(mean(therm)+sd(therm))&
      therm>(mean(therm)-sd(therm)))


mean(therm<(mean(therm)+sd(therm))&
      therm>(mean(therm)-sd(therm)))

mean(therm<(mean(therm)+sd(2*therm))&
      therm>(mean(therm)-sd(2*therm)))








