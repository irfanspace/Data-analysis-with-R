#visualization_ggplot2_palmerpenguins_data

install.packages("tidyverse")
library(tidyverse)

library(ggplot2)
library(palmerpenguins)

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

#aestehics_diff_point_color
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))

#aesthetics_diff_shape
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,shape=species))

#aesthetics_diff_shape_color
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,shape=species,color=species))

#aesthetics_size_change
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,shape=species,color=species,size=species))

#aesthetics_alpha
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,alpha=species))

#aesthetics_color_change
ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,),color="orange")

