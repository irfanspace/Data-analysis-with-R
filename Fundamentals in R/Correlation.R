
library(tidyverse)
data1 <- read_csv("E:/DATA_SET_1.csv")
glimpse(data1)

ggplot(data1, aes(x=Hours_Sun, y=LDL)) +
  geom_point()

#Covariance
H_LDL_cov <- cov(data1$Hours_Sun, data1$LDL)
round(H_LDL_cov,2)

#Correlation
H_LDL_cor <- cor(data1$Hours_Sun, data1$LDL)
round(H_LDL_cor,3)

#statistical analysis
cor.test(data1$Hours_Sun, data1$LDL)

#alternative test
cor.test(data1$Hours_Sun, data1$LDL, alternative = 'greater')

#Assumption for correlation.
#Gaussian/Normal distributions for each variable
shapiro.test(data1$Hours_Sun)
shapiro.test(data1$LDL)

#Non-parametric correlation analysis
cor.test(data1$Hours_Sun, data1$LDL, method='spearman')
