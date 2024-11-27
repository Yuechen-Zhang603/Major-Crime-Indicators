#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

# Load necessary libraries
library(dplyr)
library(readr)

# Load the raw data
crime_data <- read_csv("raw_crime_data.csv", show_col_types = FALSE)

# Data Cleaning: Remove rows with NAs or "NSA"
cleaned_data <- raw_crime_data %>%
  distinct() %>%  # Remove duplicate rows
  filter(!if_any(everything(), ~ is.na(.) | . == "NSA")) %>%  # Remove rows with NA or "NSA"
  select(-last_col())  # Remove the last column if it contains NA
  rename(
    Event_ID = EVENT_UNIQUE_ID,       # Rename columns for readability
    Year = REPORT_YEAR,
    Month = REPORT_MONTH,
    Day = REPORT_DAY,
    Crime_Type = MCI_CATEGORY,
    Neighborhood = NEIGHBOURHOOD_158, # Replace with correct neighborhood column
    Latitude = LAT_WGS84,             # Replace with latitude column
    Longitude = LONG_WGS84            # Replace with longitude column
  ) %>%
  mutate(
    Date = as.Date(paste(Year, Month, Day, sep = "-"), format = "%Y-%m-%d")  # Combine Year, Month, and Day into Date
  ) %>%
  arrange(Date)  # Order rows by date

# Save the cleaned data to a new CSV file
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

# Preview the cleaned data
head(cleaned_data)


