
library(ggplot2)
library(palmerpenguins)

ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))

#combine_of_two geom functions
ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

#separate line of different variables
ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,linetype=species))

#geom_jitter overlap data points
ggplot(data=penguins)+
  geom_jitter(mapping=aes(x=flipper_length_mm,y=body_mass_g))

##BAR chart
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut))

#color bar chart
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,color=cut))

#to fill the color inside each bar
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,fill=cut))

#clarity
ggplot(data=diamonds)+
  geom_bar(mapping=aes(x=cut,fill=clarity))