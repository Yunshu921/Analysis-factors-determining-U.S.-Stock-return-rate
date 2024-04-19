#### Preamble ####
# Purpose: Save the data
# Author: Yunshu Zhang
# Date: 12 April 2024
# Contact: yunshu.zhang@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(reshape2)

### Read data ###
data <- read.csv("inputs/data/raw_data.csv")
summary(data)

#### Save data ####

### First, select variables date, industry, pe, ret, marketvalue and optoebt

selected_data <- data %>%
  select(date, industry, pe, ret, marketvalue, optoebt)

### Secondly, caculate the average return rate and then make a data frame with respect to industry

grouped_data <- data %>%
  group_by(industry,date) %>%
  summarize(avg_returns = mean(ret))

wide_df <- dcast(grouped_data, date ~ industry, value.var = "avg_returns")

### Next we focus on industry Information Technology and Financials and then renew the data frame

data_info_and_fina = grouped_data[grouped_data$industry %in% c('Information Technology', 'Financials'), ]

wide_df <- dcast(data_info_and_fina, date ~ industry, value.var = "avg_returns")

### Using reshape2 function to make a matrix containing the cumulative returns for each column
### and then transfer the matrix d into a dataframe
d <- apply(wide_df[, -1], 2, function(x) cumprod(1 + x))
d = as.data.frame(d)


### Specifies the name of the column that will store the variable names from the wide format
### (in this case, the industry names)
d$date = wide_df[, 1]
df <- melt(d, id.vars = 'date', variable.name = 'Industry')

### Removes rows with missing values from `d` and  Converts the date column to Date format. This step ensures that the date column is recognized as dates, 
### which allows for date-based operations and plotting

d$date=wide_df[, 1]
d <- na.omit(d)
d$date <- as.Date(d$date)
d
### Save the dataframe to CSV file
write.csv(d, file = "output/data/data_industry.csv")
write.csv(wide_df, file = "output/data/data_wide_df.csv")
write.csv(selected_data, file = "output/data/selected_data.csv")


