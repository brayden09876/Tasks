setwd("~/Desktop/Evolution/Tasks/Project/data")
Data <- read.csv("ImsaOtoData_2.csv")
names(Data)
Data$length
Data$weight
New_Data <- subset(Data, select = c(year, length, weight))
New_Data$length
New_Data <- subset(New_Data, complete.cases(New_Data$year, New_Data$length, New_Data$weight))
New_Data$length
New_Data$weight
New_Data$year
New_Data$year <- factor(New_Data$year, levels = c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016))
