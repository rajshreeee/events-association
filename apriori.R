Groc <- read.transactions("~/dlr/okplease.csv", sep=",")
Groc
summary(Groc)
inspect(Groc[1:3])
itemFrequency(Groc[,1:6])
itemFrequencyPlot(Groc, support=0.3)
m1<-apriori(Groc, parameter = list(support =0.007, confidence =0.25, minlen=2))
m1
summary(m1)
inspect(m1[1:2])
inspect(sort(m1, by="lift")[1:15])
m2 <- m1[!is.redundant(m1)]
inspect(sort(m2,by ="lift")[1:15])

library(arulesViz)
plot(m2, interactive = TRUE)
plot(m2[1:10], method = "grouped")

