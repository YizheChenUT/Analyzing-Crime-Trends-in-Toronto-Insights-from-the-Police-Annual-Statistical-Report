#### Preamble ####
# Purpose: Tests simulated dataset.
# Author: Yizhe Chen
# Date: 24 SEP 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 00-simulate_data.R 
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)

#### Test data ####
## Load the simulated data
simulated_crime_data <- read_csv("data/raw_data/simulated_reported_crimes.csv")

## Check for missing values
test_missing_values <- function(data) {
  cat("\nChecking for missing values:\n")
  missing_values <- sum(is.na(data))
  if (missing_values == 0) {
    cat("No missing values found.\n")
  } else {
    cat(paste("Missing values detected: ", missing_values, "\n"))
  }
}

## Validate crime types
test_crime_types <- function(data) {
  valid_crime_types <- c("Assault", "Robbery", "Theft", "Fraud")
  cat("\nValidating crime types:\n")
  invalid_crime_types <- setdiff(unique(data$crime_type), valid_crime_types)
  if (length(invalid_crime_types) == 0) {
    cat("All crime types are valid.\n")
  } else {
    cat(paste("Invalid crime types found: ", paste(invalid_crime_types, collapse = ", "), "\n"))
  }
}

## Validate regions
test_regions <- function(data) {
  valid_regions <- c("Downtown", "Midtown", "North", "East", "West")
  cat("\nValidating regions:\n")
  invalid_regions <- setdiff(unique(data$region), valid_regions)
  if (length(invalid_regions) == 0) {
    cat("All regions are valid.\n")
  } else {
    cat(paste("Invalid regions found: ", paste(invalid_regions, collapse = ", "), "\n"))
  }
}

## Check for negative incidents
test_negative_incidents <- function(data) {
  cat("\nChecking for negative incident values:\n")
  if (any(data$incidents < 0)) {
    cat("Negative values found in the 'incidents' column.\n")
  } else {
    cat("No negative values found in the 'incidents' column.\n")
  }
}

## Run tests on the simulated data
cat("Running tests on the simulated crime data\n")
test_missing_values(simulated_crime_data)
test_crime_types(simulated_crime_data)
test_regions(simulated_crime_data)
test_negative_incidents(simulated_crime_data)