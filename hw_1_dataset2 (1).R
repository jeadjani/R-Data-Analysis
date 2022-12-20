library(readr)
library(dplyr)
ourData = read_csv(file="hw_1_dataset_2.csv")
spec(ourData)
ourData
head(ourData$County)
head(ourData)



#1
sort(table(ourData$County), decreasing = TRUE)[1]
sort(table(ourData$County), decreasing = TRUE)[2]


#2
ourData%>%
  filter(State=="MD")%>%
  count(County)%>%
  arrange(County)


#3
sort(table(ourData$State), decreasing = TRUE)[1]
sort(table(ourData$State), decreasing = TRUE)[2]




#4
ourData %>%
  group_by(State) %>%
  summarize(mun=sum(Severity>3)) %>%
  arrange(-mun) %>%
  print(n=50)


#5
ourData %>%
  group_by(State) %>%
  summarize(temp=mean(`Temperature(F)`)) %>%
  arrange(-temp) %>%
  print(n=50)




