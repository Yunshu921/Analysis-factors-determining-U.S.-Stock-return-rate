#### Preamble ####
# Purpose: Tests
# Author: Yunshu Zhang
# Date: 12 April 2024
# Contact: yunshu.zhang@mail.utoronto.ca


#### Workspace setup ####

library(testthat)

#### Test data ####
# Load your dataset
cleaned_data <- read.csv("output/data/cleaned_data_industry.csv")

## Test for the number of rows
cleaned_data$X |> unique() |> length() == 171

## Test if Information.Technology variable contains any missing values
if (anyNA(cleaned_data$Information.Technology)) {
  print("Information.Technology variable has missing values (NA)")
} else {
  print("Information.Technology variable does not have any missing values (NA)")
}

## Test if Financials variable contains any missing values
if (anyNA(cleaned_data$Financials)) {
  print("Financials variable has missing values (NA)")
} else {
  print("Financials variable does not have any missing values (NA)")
}

if (anyNA(cleaned_data$date)) {
  print("Date variable has missing values (NA)")
} else {
  print("Date variable does not have any missing values (NA)")
}
