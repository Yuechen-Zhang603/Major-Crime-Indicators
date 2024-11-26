#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


# Set seed for reproducibility
set.seed(123)

# Define neighborhood names
neighborhoods <- c(
  "Waterfront Communities-The Island", "West Humber-Clairville",
  "Bay Street Corridor", "Church-Yonge Corridor",
  "Downsview-Roding-CFB", "Moss Park",
  "Kensington-Chinatown", "Islington-City Centre West",
  "Woburn", "York University Heights"
)

# Generate random data for each crime category
assaults <- sample(200:1000, 10, replace = TRUE)
break_and_enters <- sample(100:300, 10, replace = TRUE)
drug_arrests <- sample(50:350, 10, replace = TRUE)
hazardous_incidents <- sample(100:300, 10, replace = TRUE)
sexual_assaults <- sample(10:80, 10, replace = TRUE)
thefts <- sample(5:70, 10, replace = TRUE)
vehicle_thefts <- sample(10:300, 10, replace = TRUE)

# Calculate total major crime incidents
total_major_incidents <- assaults + break_and_enters + drug_arrests +
  hazardous_incidents + sexual_assaults + thefts + vehicle_thefts

# Create the dataset as a data frame
raw_crime_data <- data.frame(
  Neighbourhood = neighborhoods,
  Assaults = assaults,
  Break_and_Enters = break_and_enters,
  Drug_Arrests = drug_arrests,
  Hazardous_Incidents = hazardous_incidents,
  Sexual_Assaults = sexual_assaults,
  Thefts = thefts,
  Vehicle_Thefts = vehicle_thefts,
  Total_Major_Incidents = total_major_incidents
)

# Order by total major incidents in descending order
raw_crime_data <- raw_crime_data[order(-raw_crime_data$Total_Major_Incidents), ]

# View the simulated dataset
print(raw_crime_data)

write_csv(raw_crime_data, here::here("data/00-simulated_data/simulated_data.csv"))
