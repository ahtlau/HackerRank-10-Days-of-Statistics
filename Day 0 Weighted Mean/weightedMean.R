# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script calculates the weighted mean of any given array

# Setup -------------------------------------------------------------------

remove(list = ls())

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 0 Weighted Mean")

library(dplyr)
library(stringr)

# Analysis ----------------------------------------------------------------

# Load data
(raw <- readLines(file.path("input", "input00.txt"), warn = F))

# Determine the number of elements
n <- raw[1] %>% as.double()

# Find the weighted mean
(raw[-1] %>% 
    # Collaps the last two rows
    paste(collapse = " ") %>% 
    str_split(" ") %>% 
    unlist() %>% 
    str_trim("both") %>% 
    as.double() %>% 
    # Turn them into a matrix
    # nrow equals the number of elements
    # distribute numbers by column
    matrix(nrow = n) %>% 
    # Turn it into a data frame
    as.data.frame () %>%
    mutate(num = sum(V1*V2),
           denom = sum(V2),
           w_mean = round(num/denom, 1)) %>% 
    pull(w_mean) %>% 
    unique() %>% 
    # Format number such that it has a 1 significant digit
    format(nsmall = 1) %>% 
    write(., stdout()))



