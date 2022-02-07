#### Preamble ####
# Purpose: Download data form opendatatoronto.
# Author: Winny Peng
# Data: 6 February 2022
# Contact: winny.peng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Data Download ####
# From https://open.toronto.ca/dataset/polls-conducted-by-the-city/

# Get all resources for this package.
resources <- list_package_resources("7bce9bf4-be5c-4261-af01-abfbc3510309")

# There are 2 resources, but we are specifically getting the CSV one.
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
toronto_poll_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save Data ####
write_csv(toronto_poll_data, "inputs/data/toronto_poll_data.csv")