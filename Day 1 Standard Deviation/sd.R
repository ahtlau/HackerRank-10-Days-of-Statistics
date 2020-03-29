# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script calculates the (population) standard deviation of a given array

# Setup -------------------------------------------------------------------

remove(list = ls())

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 1 Standard Deviation")

library(dplyr)
library(stringr)

# Analysis ----------------------------------------------------------------

# Load data
(raw <- readLines(file.path("input", "input00.txt"), warn = F))

# Extract and clean arrays
(arr <- raw[2] %>% 
    str_split(" ") %>% 
    unlist() %>% 
    str_trim(side = "both") %>% 
    as.double() %>% 
    sort())

# Calculate the numerator
(numerator <- sum((arr - mean(arr))^2))

# Calculate population standard deviation
# Round the number to 1 decimal place
(sqrt(numerator/length(arr)) %>% 
    round(., 1) %>% 
    write(., stdout()))
