# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script calculates the interquartiles of a given array

# Setup -------------------------------------------------------------------

remove(list = ls())

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 1 Interquartile Range")

library(dplyr)
library(stringr)

# Analysis ----------------------------------------------------------------

# Load data
(raw <- readLines(file.path("input", "input00.txt"), warn = F))
# (raw <- readLines(file.path("input", "input01.txt"), warn = F))
# (raw <- readLines(file.path("input", "input02.txt"), warn = F))

# Extract and clean array
clean_string <- function (i) {
  (raw[i] %>% 
     str_split(" ") %>% 
     unlist() %>% 
     str_trim(side = "both") %>% 
     as.double())
}

# Call function to each string
(number <- clean_string(i = 2))
(freq <- clean_string(i = 3))

# Gen array per the number and frequency
(arr <- rep(number, freq) %>% sort())

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

# Calculate the 1st and 3rd quartiles
(q_1st <- median(array_lower))
(q_3rd <- median(array_upper))

# Calculate interquartile
# Format output such that integers will have 1 trailing signficant digit
(q_3rd - q_1st) %>% 
  format(nsmall = 1) %>% 
  write(stdout())
