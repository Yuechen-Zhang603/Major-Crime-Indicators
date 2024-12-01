#### Preamble ####
# Purpose: Models
# Author: Yuechen Zhang
# Date: 1 December 2024
# Contact: yuechen.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# 


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

#### Model data ####
# Assuming 'Crime_Type' is categorical and 'REPORT_HOUR' is numerical
crime_model <- stan_glm(
  formula = REPORT_HOUR ~ Year + Crime_Type + Neighborhood,
  data = analysis_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 853
)

#### Save model ####
saveRDS(
  crime_model,
  file = "models/Major_Crime_Indicator_model.rds"
)




