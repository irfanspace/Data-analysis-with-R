
library(tidyverse)
data1 <- read_csv("E:/DATA_SET_1.csv")

cor.test(data1$Hours_Sun, data1$LDL)