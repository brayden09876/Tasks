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
New_Data$decade <- cut(New_Data$year, breaks = c(1980, 1990, 2000, 2010, 2020), 
                   labels = c("1980s", "1990s", "2000s", "2010s"))
eel_data <- gather(New_Data, key = "Measurement_Type", value = "measurement", -year, -decade)
EelPlot <- ggplot(eel_data, aes(x = decade, y = measurement, fill = Measurement_Type)) +
  geom_boxplot() +
  scale_fill_manual(values = c("lightblue", "lightpink"), labels = c("Length (mm)", "Weight (g)")) +
  labs(x = "Decade", y = "Measurement") +
  ggtitle("Silver Eel Change in Weight and Length by Decade")
EelPlot + theme(panel.background = element_rect(fill = "white"),
                panel.grid.major.x = element_blank(),  
                panel.grid.minor.x = element_blank(),  
                panel.grid.major.y = element_line(color = "gray"), 
                panel.grid.minor.y = element_blank(),
                panel.grid.major = element_line(color = "gray", linewidth = 0.5),
                panel.border = element_rect(color = "black", fill = NA, linewidth = 1))
