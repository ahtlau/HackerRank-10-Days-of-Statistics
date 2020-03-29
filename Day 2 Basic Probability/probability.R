# Author: Alex Liu
# Last modified: 2020-03-29
# Description: This script finds the the probility that the sum of two fair dices is no more than 10

# Setup -------------------------------------------------------------------

remove(list = ls())

setwd("/Users/ahtlau/Library/Mobile Documents/com~apple~CloudDocs/Data/HackerRank - 10 Days of Statistics/Day 2 Basic Probability")

library(dplyr)
library(stringr)
library(MASS)

# Analysis ----------------------------------------------------------------

# Generate all possible outcomes
n_all <- expand.grid(dice_1 = c(1:6),
                     dice_2 = c(1:6))

# Find the number of instances where the sum of two dices is at most 9
n_favourable <- n_all %>% 
  mutate(total = dice_1 + dice_2) %>% 
  filter(total <= 9)

# calculate probability
(nrow(n_favourable)/nrow(n_all) %>% 
    fractions())




