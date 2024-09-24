#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Yizhe Chen
# Date: 24 SEP 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Any other information needed? No


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
package <- show_package("police-annual-statistical-report-reported-crimes") # get package

resources <- list_package_resources("police-annual-statistical-report-reported-crimes") # get all resources for this package

datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson')) # identify datastore resources

data <- filter(datastore_resources, row_number()==1) %>% get_resource() # load the first datastore resource as a sample


#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv")

