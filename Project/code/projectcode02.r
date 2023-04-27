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
eel_test <- brm(bf(length ~ (1 | year), sigma ~ (1 | year)),
    data = New_Data, family = gaussian())
eel_test
plot(eel_test)
weight_test <- brm(bf(weight ~ (1 | year), sigma ~ (1 | year)),
                   data = New_Data, family = gaussian())
weight_test
plot(weight_test)
LengthEffects <- ranef(eel_test)
WeightEffects <- ranef(weight_test)

# bayesplot & stanplot packages for pretty plots.
# you care about the random effect
plot(c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016), LengthEffects$year[,1,1], type="b")
plot(c(1982, 1986, 1991, 1992, 2012, 2014, 2015, 2016), WeightEffects$year[,1,1], type="b")

library(magrittr)
library(dplyr)
library(purrr)
library(forcats)
library(tidyr)
library(modelr)
library(ggdist)
library(tidybayes)
library(ggplot2)
library(cowplot)
library(rstan)
library(brms)
library(ggrepel)
library(RColorBrewer)
library(gganimate)
library(posterior)
library(distributional)

theme_set(theme_tidybayes() + panel_border())
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

New_Data %>%
  data_grid(year) %>%
  add_epred_draws(eel_test, dpar = c("mu", "sigma")) %>%
  sample_draws(30) %>%
  ggplot(aes(y = year)) +
  stat_slab(aes(xdist = dist_normal(mu, sigma)), 
            slab_color = "gray65", alpha = 1/10, fill = NA
  ) +
  geom_point(aes(x = length), shape = 21, fill = "#9ECAE1", size = 2)
