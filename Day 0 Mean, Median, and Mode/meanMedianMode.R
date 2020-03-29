# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script calculates the mean, median, mode of any given array

# Setup -------------------------------------------------------------------

remove(list = ls())

library(dplyr)
library(stringr)

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 0 Mean, Median, and Mode")

# Analysis ---------------------------------------------------------------

# Load data
(raw <- readLines(file.path("input", "input00.txt"), warn = F))

# Extract arrays
(arr <- raw[2] %>% 
    str_split(" ") %>% 
    unlist() %>% 
    str_trim("both") %>% 
    as.double())

# Write mean, median and mode function
sum_stats <- function (data) {
  # Calculate mean
  (mean <- round(mean(arr), 1))
  
  # Calculate median
  (median <- round(median(arr), 1))
  
  # Calculate mode
  # Tabulate count for each number
  (mode <- table(arr) %>% 
    # Reshape to long
    reshape2::melt() %>% 
    # Filter on the max occurance
    filter(value == max(value)) %>% 
    # Pullout the number column 
    pull(arr) %>% 
    # Find the min number 
    min())
  
  # return(list(mean, median, mode))
  return(c(mean, median, mode))
}

# Call function. Print results vertically
write(paste(sum_stats(arr), collapse = "\n"), stdout())


