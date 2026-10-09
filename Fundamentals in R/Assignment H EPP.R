library(readr)
H <- read.csv("C:/EPP/H.csv")
library(agricolae)
# One-way ANOVA, Tukey's HSD, DMRT, and LSD tests for Seedling stage
seedling_stage <- subset(H, `Application.time` == "Seedling stage")
anova_seedling <- aov(`Percent.disease.incidence` ~ Treatment, data = seedling_stage)
summary(anova_seedling)
tukey_seedling <- HSD.test(anova_seedling, "Treatment", group = TRUE)
print(tukey_seedling)
dmrt_seedling <- LSD.test(anova_seedling, "Treatment", group = TRUE)
print(dmrt_seedling)
lsd_seedling <- LSD.test(anova_seedling, "Treatment", console = TRUE)
# One-way ANOVA, Tukey's HSD, DMRT, and LSD tests for Before flowering
before_flowering <- subset(H, `Application.time` == "Before flowering")
anova_before <- aov(`Percent.disease.incidence` ~ Treatment, data = before_flowering)
summary(anova_before)
tukey_before <- HSD.test(anova_before, "Treatment", group = TRUE)
print(tukey_before)
dmrt_before <- LSD.test(anova_before, "Treatment", group = TRUE)
print(dmrt_before)
lsd_before <- LSD.test(anova_before, "Treatment", console = TRUE)
library(ggplot2)
# Boxplot for Seedling stage
ggplot(seedling_stage, aes(x = Treatment, y = `Percent.disease.incidence`, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "Percent Disease Incidence - Seedling stage", x = "Treatment", y = "Percent Disease Incidence")
# Boxplot for Before flowering
ggplot(before_flowering, aes(x = Treatment, y = `Percent.disease.incidence`, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "Percent Disease Incidence - Before flowering", x = "Treatment", y = "Percent Disease Incidence")
# Extract the groups from Tukey's HSD results for soil drenching 
tukey_soil_groups <- tukey_soil$groups
# Extract the groups from Tukey's HSD results for spray
tukey_spray_groups <- tukey_spray$groups
# Combine the groups
combined_groups <- rbind(tukey_soil_groups, tukey_spray_groups)
# Print the combined groups
print(combined_groups)


# Install and load required packages
install.packages("agricolae")
library(agricolae)

# Create a dataframe with the provided data
data <- data.frame(
  Treatment = c(rep("Bacillus sp.1", 4), rep("Bavistin 50 WP", 4), rep("Bacillus sp.3", 4), rep("Bacillus sp.4", 4), rep("No treatment", 4), rep("Bacillus sp.5", 4), rep("Bacillus sp.6", 4)),
  Application_time = c(rep("Seedlig stage", 28), rep("Before flowering", 28)),
  Percent_disease_incidence = c(59.98, 73.02, 74.33, 69.11, 19.56, 29.99, 23.47, 16.95, 65.2, 58.68, 83.45, 71.72, 88.67, 76.93, 99.1, 86.06, 99.1, 105.62, 117.36, 109.53, 91.28, 82.15, 70.41, 87.36, 7.82, 15.65, 18.26, 26.08, 57.37, 65.2, 71.72, 87.36, 44.33, 28.69, 16.95, 26.08, 65.2, 58.68, 83.45, 71.72, 88.67, 76.93, 99.1, 86.06, 113.44, 100.4, 129.09, 93.88, 100.4, 89.97, 76.93, 95.19, 82.15, 56.07, 71.72, 73.02)
)

# Separate data for each application time
seedling_data <- subset(data, Application_time == "Seedlig stage")
before_flowering_data <- subset(data, Application_time == "Before flowering")

# One-way ANOVA for Seedling Stage
anova_seedling <- aov(Percent_disease_incidence ~ Treatment, data = seedling_data)
summary(anova_seedling)

# Perform Tukey's HSD, DMRT, and LSD tests for Seedling Stage
tukey_seedling <- HSD.test(anova_seedling, "Treatment", group = TRUE)
tukey_seedling

dmrt_seedling <- LSD.test(anova_seedling, "Treatment", group = TRUE)
dmrt_seedling

lsd_seedling <- LSD.test(anova_seedling, "Treatment", group = TRUE)
lsd_seedling

# One-way ANOVA for Before Flowering
anova_before_flowering <- aov(Percent_disease_incidence ~ Treatment, data = before_flowering_data)
summary(anova_before_flowering)

# Perform Tukey's HSD, DMRT, and LSD tests for Before Flowering
tukey_before_flowering <- HSD.test(anova_before_flowering, "Treatment", group = TRUE)
tukey_before_flowering

dmrt_before_flowering <- LSD.test(anova_before_flowering, "Treatment", group = TRUE)
dmrt_before_flowering

lsd_before_flowering <- LSD.test(anova_before_flowering, "Treatment", group = TRUE)
lsd_before_flowering

# Combine Tukey's HSD results for both application times
tukey_combined <- rbind(tukey_seedling$groups, tukey_before_flowering$groups)
tukey_combined$Application_time <- c(rep("Seedling stage", nrow(tukey_seedling$groups)), rep("Before flowering", nrow(tukey_before_flowering$groups)))

# Plotting
library(ggplot2)

# Create a plot
ggplot(tukey_combined, aes(x = Treatment, y = y, fill = groups)) +
  geom_col(position = position_dodge()) +
  facet_wrap(~ Application_time, scales = "free_y") +
  geom_text(aes(label = groups), vjust = -0.5) +
  labs(title = "Tukey's HSD: Significant Differences Between Treatments",
       x = "Treatment",
       y = "Percent Disease Incidence") +
  theme_minimal()

# Table showing Tukey's HSD results with lettering
tukey_combined_table <- tukey_combined[c("Treatment", "groups", "Application_time")]
tukey_combined_table <- tukey_combined_table[order(tukey_combined_table$Application_time, tukey_combined_table$Treatment), ]

# Print the table
print(tukey_combined_table)



