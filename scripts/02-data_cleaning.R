#### Preamble ####
# Purpose: Cleans and prepares the raw crime data from the Toronto Police Annual Statistical Report
# Author: Yizhe Chen
# Date: 24 SEP 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - Downloaded raw crime data from Open Data Toronto
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

## Clean the data set by standardizing column names, selecting relevant columns, and dealing with inconsistencies
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>  # Clean column names
  select(report_year, division, category, subtype, count, count_cleared) |>  # Select relevant columns for analysis
  filter(!is.na(count), count > 0) |>  # Filter invalid event records (records with a count of 0)
  mutate(
    count_ = as.numeric(count),  # Convert 'count' column to numeric value
    count_cleared = as.numeric(count_cleared)  # Convert 'count_cleared' column to numeric value
  ) |> 
  drop_na()  # Remove rows with missing values

## Rename columns for understanding
cleaned_data <- cleaned_data |>
  rename(
    year = report_year,  # Rename report_year to year
    division_name = division,  # Rename division to division_name
    crime_category = category,  # Rename category to crime_category
    crime_subtype = subtype,  # Rename subtype to crime_subtype
    incidents_reported = count,  # Rename count to incidents_reported
    incidents_cleared = count_cleared  # Rename count_cleared to incidents_cleared
  )

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
