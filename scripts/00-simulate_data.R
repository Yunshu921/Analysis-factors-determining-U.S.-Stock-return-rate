#### Preamble ####
# Purpose: Simulates data
# Author: Yunshu Zhang
# Date: 12 April 2024
# Contact: yunshu.zhang@mail.utoronto.ca



#### Workspace setup ####

library(tidyverse)
library(dplyr)



#### Set up and Simulate data ####

set.seed(1099)

# Create simulated data in different industries including Discretionaly, Energy
# Financials, Health Care, Industrials, Information Technology, and Materials.
# From 2010 to 2024, they have different return rates.


# Create simulated data with industries
simulated_return_rate_data <- tibble(
  industry = rep(c("Financials", "Health Care", "Industrials", "Information Technology", "Materials"), each = 15),
  year = rep(2010:2024, times = 5),
  return_rate = c(runif(75, min = -0.6, max = 0.98))
)

