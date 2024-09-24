#### Preamble ####
# Purpose: Simulates reported crime data, such as number of incidents, type of crime and regional distribution.
# Author: Yizhe Chen
# Date: 24 SEP 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(304) #Setting seed to ensure reproducibility

## Simulate crime data sets
simulate_crime_data <- function(n = 1000) {
  data.frame(
    crime_id = 1:n,
    crime_type = sample(c("Assault", "Robbery", "Theft", "Fraud"), n, replace = TRUE),
    region = sample(c("Downtown", "Midtown", "North", "East", "West"), n, replace = TRUE),
    incidents = rpois(n, lambda = 5)
  )
}

simulated_crime_data <- simulate_crime_data()

##Save crime data
write.csv(simulated_crime_data, "data/raw_data/simulated_reported_crimes.csv", row.names = FALSE)


