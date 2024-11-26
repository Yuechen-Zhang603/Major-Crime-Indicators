#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Loading the needed packages ####
library(opendatatoronto)
library(tidyverse)
library(here)

#### Checking the working directory to ensure the write_csv works properly ####
getwd()

#### Downloading the data ####
data <- search_packages("major-crime-indicators")
data

data <- data %>%
  list_package_resources()
data

data <- data[2, ] %>%
  get_resource()
data
#### Write the data ####
write_csv(data, here::here("data/raw_data/raw_data.csv"))
         
