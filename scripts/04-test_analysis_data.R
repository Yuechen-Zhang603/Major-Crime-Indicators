#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/02-analysis_data/analysis_data.csv")


# Data Testing and Exploration
# 1. Check the structure of the dataset
str(analysis_data)

# 2. Check for missing values in the dataset
missing_values <- colSums(is.na(analysis_data))
print("Missing Values per Column:")
print(missing_values)

# 3. Summary statistics for numeric columns
summary_statistics <- analysis_data %>%
  summarise(across(where(is.numeric), list(mean = mean, median = median, sd = sd), na.rm = TRUE))
print("Summary Statistics for Numeric Variables:")
print(summary_statistics)

# Basic Analysis
# 4. Count unique categories in categorical variables (e.g., Crime_Type or Neighborhood)
category_counts <- analysis_data %>%
  summarise(across(where(is.character), ~ n_distinct(.)))
print("Unique Categories in Categorical Variables:")
print(category_counts)

# 5. Aggregate total crimes by Year (or any temporal variable)
yearly_crime <- analysis_data %>%
  group_by(Year = as.numeric(REPORT_YEAR)) %>%
  summarise(Total_Crimes = n(), .groups = "drop")
print("Yearly Crime Counts:")
print(yearly_crime)

# 6. Plot: Yearly crime trends
ggplot(yearly_crime, aes(x = Year, y = Total_Crimes)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Yearly Crime Trends",
    x = "Year",
    y = "Total Reported Crimes"
  ) +
  theme_minimal()

# 7. Crime by Category Analysis (if applicable)
crime_by_category <- analysis_data %>%
  group_by(Crime_Type = MCI_CATEGORY) %>%
  summarise(Total = n(), .groups = "drop") %>%
  arrange(desc(Total))
print("Crime Counts by Category:")
print(crime_by_category)

# 8. Plot: Crime Distribution by Category
ggplot(crime_by_category, aes(x = reorder(Crime_Type, Total), y = Total, fill = Crime_Type)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  coord_flip() +
  labs(
    title = "Crime Distribution by Category",
    x = "Crime Type",
    y = "Total Reported Crimes"
  ) +
  theme_minimal()


