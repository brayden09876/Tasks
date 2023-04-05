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
New_Data$decade
eel_data <- gather(New_Data, key = "Measurement_Type", value = "measurement", -year, -decade)
EelPlot <- ggplot(eel_data, aes(x = decade, y = measurement, fill = Measurement_Type)) +
  geom_boxplot() +
  scale_fill_manual(values = c("lightblue", "lightpink"), labels = c("Length (mm)", "Weight (g)")) +
  labs(x = "Decade", y = "Measurement") +
  guides(fill = guide_legend(title = "Measurement Type")) +
  ggtitle("European Silver Eel Change in Weight and Length by Decade")
EelPlot + theme(panel.background = element_rect(fill = "white"),
                panel.grid.major.x = element_blank(),  
                panel.grid.minor.x = element_blank(),  
                panel.grid.major.y = element_line(color = "gray"), 
                panel.grid.minor.y = element_blank(),
                panel.grid.major = element_line(color = "gray", linewidth = 0.5),
                panel.border = element_rect(color = "black", fill = NA, linewidth = 1))
kruskal.test(New_Data$length ~ New_Data$decade)
# There is a significant change in length across the decades.
kruskal.test(New_Data$weight ~ New_Data$decade)
# There is a significant change in weight across the decades.
dunn.test(New_Data$length, New_Data$decade, method = "bonferroni")
# There is a significant change in length between 1980s and 2010s, and between 1990s and 2010s.
dunn.test(New_Data$weight, New_Data$decade, method = "bonferroni")
# There is a significant change in weight between 1980s and 1990s, between the 1980s and 2010s, and between the 1990s and 2010s.
