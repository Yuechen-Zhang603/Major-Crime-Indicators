#### Preamble ####
# Purpose: Replicated graphs from previous work
# Author: Yuechen Zhang
# Date: 1 December 2024
# Contact: yuechen.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]



#### Workspace setup ####
library(tidyverse)

#### Load data ####
# Replace with your dataset path
analysis_data <- read_csv("data/analysis_data.csv")

#### Data transformation ####
# Example: Summarize the number of crimes by year and type
crime_summary <- analysis_data %>%
  group_by(Year, Crime_Type) %>%
  summarise(Count = n(), .groups = "drop")

#### Create visualization ####
# Example: Replicate a bar chart showing crime counts by type and year
ggplot(crime_summary, aes(x = Year, y = Count, fill = Crime_Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Crime Counts by Type and Year",
    x = "Year",
    y = "Number of Crimes",
    fill = "Crime Type"
  ) +
  theme_minimal()


