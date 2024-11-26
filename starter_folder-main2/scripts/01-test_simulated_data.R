#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Australian 
  #electoral divisions dataset.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


# Load necessary libraries
library(dplyr)

# Load the dataset (replace 'simulated_data.csv' with your actual file path)
data <- read.csv("simulated_data.csv")

# Test if the dataset is successfully loaded
if (!exists("data")) {
  stop("Data was not successfully loaded. Please check the file path or format.")
} else {
  print("Data successfully loaded!")
}

# Check the number of rows and columns in the dataset
cat("Number of Rows:", nrow(data), "\n")
cat("Number of Columns:", ncol(data), "\n")

# Display column names
cat("Column Names:\n")
print(colnames(data))

# Display the first few rows
cat("First few rows of the dataset:\n")
print(head(data))

# Check for missing values
cat("Checking for missing values:\n")
print(sapply(data, function(x) sum(is.na(x))))

# Summary statistics
cat("Summary of the dataset:\n")
print(summary(data))

