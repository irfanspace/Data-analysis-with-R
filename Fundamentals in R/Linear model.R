#Linear Model

##Linear model general syntax
##lm(<formula>, <data>)
##lm(Response~Predictor, data)
library(tidyverse)
data1 <- read.csv("E:/DATA_SET_1.csv", row.names = 1)
glimpse(data1)

##Linear model with Weight as response to LDL predictor
wt_vs_ldl <- lm(Weight ~ LDL, data1)
print(wt_vs_ldl)
#statistics
summary(wt_vs_ldl)

#Access the summary by a variable
p <- summary(wt_vs_ldl)
p$r.squared

#Evaluation of the linear model
#First with a plot of our two variables, and the inear fit.
plot <- data1 %>%
  ggplot(aes(x = LDL, y = Weight))+
  geom_point()+
  xlab("LDL")+
  ylab("Weight")+
  geom_smooth(method = 'lm', se = FALSE)
plot

#distribution of the residuals
mean(wt_vs_ldl$residuals)

hist(wt_vs_ldl$residuals)

## QQ-plot
#Comparing the residual distribution to a theoretical normal distribution in a quantile-quantile-plot (QQ-plot).

plot(wt_vs_ldl,2)

#Fitted value vs Residuals
options(repr.plot.width = 6, repr.plot.height = 6) 
plot(wt_vs_ldl, 1)
         