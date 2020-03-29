# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script calculates median and the 1st quartile, 3rd quartile of a given array

# Setup -------------------------------------------------------------------

remove(list = ls())

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 1 Quartiles")

library(dplyr)
library(stringr)

# Analysis ----------------------------------------------------------------

# Load data
(raw <- readLines(file.path("input", "input00.txt"), warn = F))
# (raw <- readLines(file.path("input", "input01.txt"), warn = F))
# (raw <- readLines(file.path("input", "input02.txt"), warn = F))
# (raw <- readLines(file.path("input", "input03.txt"), warn = F))

# Extract and clean arrays
(arr <- raw[2] %>% 
    str_split(" ") %>% 
    unlist() %>% 
    str_trim(side = "both") %>% 
    as.double() %>% 
    sort())

# Length of arrays
(len <- length(arr))

# Separate arrays into two parts depending on the number of elements in an array
# If even, divide the array in exactly half
# If odd, cut the array in half the median being the cutoff point
# The following algorithm works even when there are duplicates of numbers around the median
if (len %% 2 == 0) {
  array_lower <- arr[1:(len/2)]
  array_upper <- arr[-(1:(len/2))]
} else {
  array_lower <- arr[1:floor((len/2))]
  array_upper <- arr[(ceiling((len/2))+1):len]
}

# Calculate median and 1st and 3rd quartiles and save results
results <- c(median(array_lower), # 1st quartile
             median(arr),         # median
             median(array_upper)) # 3rd quartile

# Print results vertically
write(cat(results, sep = "\n"), stdout())

# Note the results are different than those from using the quantile command 
# quantile(arr)



